require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do

  describe "GET #index" do
    it "returns all the invoices belonging to the merchant" do
      merchant = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant.id)
      invoice2 = create(:invoice, merchant_id: merchant.id)
      invoice3 = create(:invoice)

      get :index, id: merchant.id, format: :json

      parsed_invoices = JSON.parse(response.body)
      first_inv = parsed_invoices.first
      last_inv = parsed_invoices.last

      expect(response.status).to eq(200)
      expect(parsed_invoices.count).to eq(2)
      expect(invoice1.id).to eq(first_inv['id'])
      expect(invoice2.id).to eq(last_inv['id'])

    end
  end
end
