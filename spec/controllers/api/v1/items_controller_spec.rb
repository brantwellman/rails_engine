require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns all items in json" do
      item1 = create(:item, name: "George")
      item2 = create(:item, name: "Fred")

      get :index, format: :json
      items = JSON.parse(response.body)
      first_item = items.first
      last_item = items.last

      expect(response.status).to eq(200)
      expect("George").to eq(first_item['name'])
      expect("Fred").to eq(last_item['name'])
      expect(items.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns invoice with specified id in json" do
      item3 = create(:item, name: "George")
      item4 = create(:item, name: "Fred")

      get :show, id: item3.id, format: :json

      parsed_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect("George").to eq(parsed_item['name'])
      expect(item3.id).to eq(parsed_item['id'])
    end
  end
end
