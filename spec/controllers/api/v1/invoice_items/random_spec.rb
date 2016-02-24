require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random customer" do
      customer1 = InvoiceItem.create(quantity: 5, unit_price: 7)
      customer2 = InvoiceItem.create(quantity: 6, unit_price: 8)

      get :show, format: :json

      expect(response.status).to eq(200)
      customer = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
