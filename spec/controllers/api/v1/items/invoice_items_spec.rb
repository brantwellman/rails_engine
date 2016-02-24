require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do

  describe "GET #index" do
    it "returns the invoice_items belonging to the item" do
      item = create(:item)
      invoice_item1 = create(:invoice_item, item_id: item.id)
      invoice_item2 = create(:invoice_item, item_id: item.id)
      inovice_item3 = create(:invoice_item)

      get :index, id: item.id, format: :json

      parsed_invoice_items = JSON.parse(response.body)

      first_item = parsed_invoice_items.first
      last_item = parsed_invoice_items.last

      expect(response.status).to eq(200)
      expect(parsed_invoice_items.count).to eq(2)

      expect(invoice_item1.id).to eq(first_item['id'])
      expect(invoice_item2.id).to eq(last_item['id'])
    end
  end
end
