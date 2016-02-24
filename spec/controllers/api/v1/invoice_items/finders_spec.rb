require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindersController, type: :controller do

  describe "GET #show" do
    it "returns the one invoice_item with the given attribute" do
      invoice_item1 = InvoiceItem.create(quantity: 5, unit_price: 4)
      invoice_item2 = InvoiceItem.create(quantity: 6, unit_price: 5)

      get :show, id: invoice_item1.id, format: :json

      expect(response.status).to eq(200)
      invoice_item =  JSON.parse(response.body)

      expect(5).to eq(invoice_item['quantity'])

      get :show, quantity: invoice_item2.quantity, format: :json
      invoice_itme2 =  JSON.parse(response.body)

      expect(2).to eq(invoice_itme2['id'])
    end
  end

  describe "GET #index" do
    it "returns all the invoice_items with the given attribute" do
      invoice_item3 = InvoiceItem.create(quantity: 8, unit_price: 9)
      invoice_item4 = InvoiceItem.create(quantity: 8, unit_price: 10)
      invoice_items = [invoice_item3, invoice_item4]

      get :index, id: invoice_item3.id, format: :json
      expect(response.status).to eq(200)
      invoice_item =  JSON.parse(response.body)

      expect("9.0").to eq(invoice_item.first['unit_price'])

      get :index, quantity: 8, format: :json
      invoice_items = JSON.parse(response.body)

      expect(invoice_items.count).to eq(2)

      first_item = invoice_items.first
      last_item = invoice_items.last

      expect(response.status).to eq(200)
      expect(invoice_item3.id).to eq(first_item['id'])
      expect(invoice_item4.id).to eq(last_item['id'])
    end
  end
end
