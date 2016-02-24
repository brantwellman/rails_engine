require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe "GET #index" do
    it "returns all transactions in json" do
      transaction1 = create(:transaction, result: "success")
      transaction2 = create(:transaction, result: "canceled")

      get :index, format: :json
      transactions = JSON.parse(response.body)
      first_transaction = transactions.first
      last_transaction = transactions.last

      expect(response.status).to eq(200)
      expect("success").to eq(first_transaction['result'])
      expect("canceled").to eq(last_transaction['result'])
      expect(transactions.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns transaction with specified id in json" do
      transaction3 = create(:transaction, result: "success")
      transaction4 = create(:transaction, result: "cancled")

      get :show, id: transaction3.id, format: :json

      parsed_transaction = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect("success").to eq(parsed_transaction['result'])
      expect(transaction3.id).to eq(parsed_transaction['id'])
    end
  end
end
