require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  describe "GET #index" do
    it "returns all merchants in json" do
      merchant1 = create(:merchant, name: "George")
      merchant2 = create(:merchant, name: "Fred")

      get :index, format: :json
      merchants = JSON.parse(response.body)
      first_merchant = merchants.first
      last_merchant = merchants.last

      expect(response.status).to eq(200)
      expect("George").to eq(first_merchant['name'])
      expect("Fred").to eq(last_merchant['name'])
      expect(merchants.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns merchant with specified id in json" do
      merchant3 = create(:merchant, name: "George")
      merchant4 = create(:merchant, name: "Fred")

      get :show, id: merchant3.id, format: :json

      parsed_merchant = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect("George").to eq(parsed_merchant['name'])
      expect(merchant3.id).to eq(parsed_merchant['id'])
    end
  end
end
