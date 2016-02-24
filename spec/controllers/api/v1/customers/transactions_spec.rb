require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do

  describe "GET #index" do
    it "returns all the transacations belonging to the customer" do
      customer = create(:customer)
      invoice1 = create(:invoice, customer_id: customer.id)
      invoice2 = create(:invoice, customer_id: customer.id)
      transaction1 = create(:transaction, invoice_id: invoice1.id)
      transaction2 = create(:transaction, invoice_id: invoice2.id)
      transaction3 = create(:transaction)

      transactions = [transaction1, transaction2, transaction3]

      get :index, id: customer.id, format: :json

      parsed_transactions = JSON.parse(response.body)
      first_trans = parsed_transactions.first
      last_trans = parsed_transactions.last

      expect(response.status).to eq(200)
      expect(parsed_transactions.count).to eq(2)
      expect(transaction1.id).to eq(first_trans['id'])
      expect(transaction2.id).to eq(last_trans['id'])

    end
  end
end
