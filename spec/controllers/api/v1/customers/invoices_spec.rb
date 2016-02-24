require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do

  describe "GET #index" do
    it "returns all the invoices belonging to the customer" do
      customer = create(:customer)
      invoice1 = create(:invoice, customer_id: customer.id)
      invoice2 = create(:invoice, customer_id: customer.id)
      invoice3 = create(:invoice)

      invoices = [invoice1, invoice2, invoice3]

      get :index, id: customer.id, format: :json

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
