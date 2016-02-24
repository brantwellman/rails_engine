require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do

  describe "GET #show" do
    it "returns the customer belonging to the invoice" do
      customer1 = create(:customer)
      customer2 = create(:customer)
      invoice = create(:invoice, customer_id: customer1.id)

      get :show, id: invoice.id, format: :json

      parsed_customer = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(customer1.id).to eq(parsed_customer['id'])
    end
  end
end
