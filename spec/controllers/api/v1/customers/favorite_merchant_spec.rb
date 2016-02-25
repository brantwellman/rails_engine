require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantController, type: :controller do

  describe "GET #index" do
    it "returns the favorite merchant of a customer" do
      merchant1, merchant2 = create_list(:merchant, 2)
      customer = create(:customer)
      invoice1 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id)
      invoice2 = create(:invoice, customer_id: customer.id, merchant_id: merchant1.id)
      invoice3 = create(:invoice, customer_id: customer.id, merchant_id: merchant2.id)
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

      get :show, id: customer.id, format: :json

      parsed_merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_merchant['id']).to eq(merchant1.id)
      expect(parsed_merchant['name']).to eq(merchant1.name)
    end
  end
end
