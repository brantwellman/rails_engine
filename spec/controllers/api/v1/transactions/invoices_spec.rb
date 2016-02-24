require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do

  describe "GET #show" do
    it "returns the invoice belonging to the transaction" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      transaction = create(:transaction, invoice_id: invoice1.id)

      get :show, id: transaction.id, format: :json

      parsed_invoice = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(invoice1.id).to eq(parsed_invoice['id'])
    end
  end
end
