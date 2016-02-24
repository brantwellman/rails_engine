require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random merchant" do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant, name: "Fred")

      get :show, format: :json

      expect(response.status).to eq(200)
      merchant = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
