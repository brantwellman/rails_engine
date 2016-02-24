require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindersController, type: :controller do

  describe "GET #show" do
    it "returns the one invoice with the given attribute" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice3 = create(:invoice, status: "dead")
      get :show, id: invoice1.id, format: :json

      expect(response.status).to eq(200)
      parsed_invoice1 =  JSON.parse(response.body)

      expect("shipped").to eq(parsed_invoice1['status'])

      get :show, status: invoice3.status, format: :json
      parsed_invoice3 =  JSON.parse(response.body)

      expect(invoice3.customer_id).to eq(parsed_invoice3['customer_id'])
    end
  end

  describe "GET #index" do
    it "returns all the invoices with the given attribute" do
      invoice4, invoice5 = create_list(:invoice, 2)
      invoice6 = create(:invoice, status: "dead")

      invoices = [invoice4, invoice5, invoice6]

      get :index, status: "dead", format: :json
      expect(response.status).to eq(200)

      parsed_invoice = JSON.parse(response.body)

      expect(invoice6.id).to eq(parsed_invoice.first['id'])

      get :index, status: "shipped", format: :json
      parsed_invoices = JSON.parse(response.body)

      expect(parsed_invoices.count).to eq(2)

      first_inv = parsed_invoices.first
      last_inv = parsed_invoices.last

      expect(response.status).to eq(200)
      expect(invoice4.id).to eq(first_inv['id'])
      expect(invoice5.id).to eq(last_inv['id'])
    end
  end
end
