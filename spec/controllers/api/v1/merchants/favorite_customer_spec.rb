require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomerController, type: :controller do

  describe "GET #index" do
    it "returns the favorite customer of a merchant" do
      customer1, customer2 = create_list(:customer, 2)
      merchant = create(:merchant)
      invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant.id)
      invoice2 = create(:invoice, customer_id: customer1.id, merchant_id: merchant.id)
      invoice3 = create(:invoice, customer_id: customer2.id, merchant_id: merchant.id)
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "success")
      transaction2 = create(:transaction, invoice_id: invoice2.id, result: "success")
      transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

      get :show, id: merchant.id, format: :json

      parsed_customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_customer['id']).to eq(customer1.id)
      expect(parsed_customer['first_name']).to eq(customer1.first_name)
    end
  end
end
