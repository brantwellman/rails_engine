require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindersController, type: :controller do

  describe "GET #show" do
    it "returns the one merchant with the given attribute" do
      merchant1 = create(:merchant, name: "Busy1")
      merchant2 = create(:merchant, name: "Busy2")
      merchant3 = create(:merchant, name: "Busy3")

      get :show, id: merchant1.id, format: :json

      expect(response.status).to eq(200)
      parsed_merchant1 = JSON.parse(response.body)

      expect(merchant1.name).to eq(parsed_merchant1['name'])

      get :show, name: merchant3.name.upcase, format: :json
      parsed_merchant3 = JSON.parse(response.body)

      expect(merchant3.name).to eq(parsed_merchant3['name'])
    end
  end

  describe "GET #index" do
    it "returns all the merchants with the given attribute" do
      merchant4 = create(:merchant, name: "Busy4")
      merchant5 = create(:merchant, name: "Busy4")
      merchant6 = create(:merchant, name: "Busy6")

      merchants = [merchant4, merchant5, merchant6]

      get :index, name: "BusY6", format: :json
      expect(response.status).to eq(200)

      parsed_merchant = JSON.parse(response.body)

      expect(merchant6.id).to eq(parsed_merchant.first['id'])

      get :index, name: "Busy4", format: :json
      parsed_merchants = JSON.parse(response.body)

      expect(parsed_merchants.count).to eq(2)

      first_merchant = parsed_merchants.first
      last_merchant = parsed_merchants.last

      expect(response.status).to eq(200)
      expect(merchant4.id).to eq(first_merchant['id'])
      expect(merchant5.id).to eq(last_merchant['id'])
    end
  end
end
