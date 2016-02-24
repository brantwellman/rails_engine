require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do

  describe "GET #show" do
    it "returns the item the invoice_item belongs to" do
      item1 = create(:item)
      item2 = create(:item)
      invoice_item = create(:invoice_item, item_id: item1.id)

      get :show, id: invoice_item.id, format: :json

      parsed_items = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(item1.id).to eq(parsed_items['id'])
    end
  end
end
