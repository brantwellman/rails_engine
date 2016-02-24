require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  describe "GET #index" do
    it "returns all invoice_items in json" do
      invoice_item1 = InvoiceItem.create(quantity: 5, unit_price: 4)
      invoice_item2 = InvoiceItem.create(quantity: 6, unit_price: 5)

      get :index, format: :json
      customers = JSON.parse(response.body)
      first_item = customers.first
      last_item = customers.last

      expect(response.status).to eq(200)
      expect(5).to eq(first_item['quantity'])
      expect(6).to eq(last_item['quantity'])
      expect(customers.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns invoice_item with specified id in json" do
      invoice_item1 = InvoiceItem.create(quantity: 5, unit_price: 4)
      invoice_item2 = InvoiceItem.create(quantity: 6, unit_price: 5)

      get :show, id: invoice_item1.id, format: :json

      parsed_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(5).to eq(parsed_item['quantity'])
      expect("4.0").to eq(parsed_item['unit_price'])
    end
  end
end
