require 'rails_helper'

RSpec.describe Api::V1::Merchants::PendingInvoicesController, type: :controller do

  describe "GET #index" do
    it "returns the all customers with pending invoices for a given merchant" do
      customer1, customer2, customer3 = create_list(:customer, 3)
      merchant = create(:merchant)
      invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant.id)
      invoice2 = create(:invoice, customer_id: customer2.id, merchant_id: merchant.id)
      invoice3 = create(:invoice, customer_id: customer3.id, merchant_id: merchant.id)
      transaction1 = create(:transaction, invoice_id: invoice1.id, result: "failed")
      transaction2 = create(:transaction, invoice_id: invoice2.id, result: "failed")
      transaction3 = create(:transaction, invoice_id: invoice3.id, result: "success")

      get :index, id: merchant.id, format: :json

      parsed_customers = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(parsed_customers.count).to eq(2)
      expect(parsed_customers.first['id']).to eq(customer1.id)
      expect(parsed_customers.last['id']).to eq(customer2.id)
    end
  end
end
