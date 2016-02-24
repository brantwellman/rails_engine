require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do

  describe "GET #show" do
    it "returns the invoice the invoice_item belongs to" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice)
      invoice_item = create(:invoice_item, invoice_id: invoice1.id)

      invoices = [invoice1, invoice2]

      get :show, id: invoice_item.id, format: :json

      parsed_invoices = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(invoice1.id).to eq(parsed_invoices['id'])
    end
  end
end
