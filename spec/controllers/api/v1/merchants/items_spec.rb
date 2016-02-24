require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns all the items belonging to the merchant" do
      merchant = create(:merchant)
      item1 = create(:item, merchant_id: merchant.id)
      item2 = create(:item, merchant_id: merchant.id)
      item3 = create(:item)

      get :index, id: merchant.id, format: :json

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
