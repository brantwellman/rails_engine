require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do

  describe "GET #show" do
    it "returns the merchant belonging to the invoice" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      invoice = create(:invoice, merchant_id: merchant1.id)

      get :show, id: invoice.id, format: :json

      parsed_merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(merchant1.id).to eq(parsed_merchant['id'])
    end
  end
end
