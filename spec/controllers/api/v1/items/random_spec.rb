require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random item" do
      item1 = create(:item)
      item2 = create(:item, name: "Fred")

      get :show, format: :json

      expect(response.status).to eq(200)
      item = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
