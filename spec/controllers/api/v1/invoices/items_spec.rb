require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns the items belonging to the invoice" do
      invoice = create(:invoice)
      item1 = create(:item)
      item2 = create(:item)
      item3 = create(:item)
      invoice_item1 = create(:invoice_item, invoice_id: invoice.id, item_id: item1.id)
      invoice_item2 = create(:invoice_item, invoice_id: invoice.id, item_id: item2.id)

      get :index, id: invoice.id, format: :json

      parsed_items = JSON.parse(response.body)

      first_item = parsed_items.first
      last_item = parsed_items.last

      expect(response.status).to eq(200)
      expect(parsed_items.count).to eq(2)

      expect(item1.id).to eq(first_item['id'])
      expect(item2.id).to eq(last_item['id'])
    end
  end
end
