require 'rails_helper'

RSpec.describe Api::V1::Items::FindersController, type: :controller do

  describe "GET #show" do
    it "returns the one item with the given attribute" do
      item1, item2 = create_list(:item, 2)
      item3 = create(:item, unit_price: 10)
      get :show, id: item1.id, format: :json

      expect(response.status).to eq(200)
      parsed_item1 =  JSON.parse(response.body)

      expect(item1.name).to eq(parsed_item1['name'])

      get :show, unit_price: item3.unit_price, format: :json
      parsed_item3 =  JSON.parse(response.body)

      expect(item3.name).to eq(parsed_item3['name'])
    end
  end

  describe "GET #index" do
    it "returns all the invoices with the given attribute" do
      item4 = create(:item, unit_price: 2)
      item5 = create(:item, unit_price: 2)
      item6 = create(:item, unit_price: 10)

      items = [item4, item5, item6]

      get :index, unit_price: 10, format: :json
      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(item6.id).to eq(parsed_item.first['id'])

      get :index, unit_price: 2, format: :json
      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq(2)

      first_item = parsed_items.first
      last_item = parsed_items.last

      expect(response.status).to eq(200)
      expect(item4.id).to eq(first_item['id'])
      expect(item5.id).to eq(last_item['id'])
    end
  end
end
