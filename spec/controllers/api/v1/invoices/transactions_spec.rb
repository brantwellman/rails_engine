require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do

  describe "GET #index" do
    it "returns all the transacations belonging to the invoice" do
      invoice = create(:invoice)
      transaction1 = create(:transaction, invoice_id: invoice.id)
      transaction2 = create(:transaction, invoice_id: invoice.id)
      transaction3 = create(:transaction)

      transactions = [transaction1, transaction2, transaction3]

      get :index, id: invoice.id, format: :json

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
