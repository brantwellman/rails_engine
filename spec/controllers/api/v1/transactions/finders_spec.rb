require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindersController, type: :controller do

  describe "GET #show" do
    it "returns the one transaction with the given attribute" do
      transaction1 = create(:transaction, result: "success")
      transaction2 = create(:transaction, result: "canceled")
      transaction3 = create(:transaction, result: "other")

      get :show, id: transaction1.id, format: :json

      expect(response.status).to eq(200)
      parsed_transaction1 = JSON.parse(response.body)

      expect(transaction1.result).to eq(parsed_transaction1['result'])

      get :show, result: transaction3.result, format: :json
      parsed_transaction3 = JSON.parse(response.body)

      expect(transaction3.id).to eq(parsed_transaction3['id'])
    end
  end

  describe "GET #index" do
    it "returns all the transactions with the given attribute" do
      transaction4 = create(:transaction, result: "success")
      transaction5 = create(:transaction, result: "success")
      transaction6 = create(:transaction, result: "canceled")

      transactions = [transaction4, transaction5, transaction6]

      get :index, result: "canceled", format: :json
      expect(response.status).to eq(200)

      parsed_transaction = JSON.parse(response.body)

      expect(transaction6.id).to eq(parsed_transaction.first['id'])

      get :index, result: "success", format: :json
      parsed_transactions = JSON.parse(response.body)

      expect(parsed_transactions.count).to eq(2)

      first_transaction = parsed_transactions.first
      last_transaction = parsed_transactions.last

      expect(response.status).to eq(200)
      expect(transaction4.id).to eq(first_transaction['id'])
      expect(transaction5.id).to eq(last_transaction['id'])
    end
  end
end
