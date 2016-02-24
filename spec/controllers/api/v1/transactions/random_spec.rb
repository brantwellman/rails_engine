require 'rails_helper'

RSpec.describe Api::V1::Transactions::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random transaction" do
      transaction1 = create(:transaction)
      transaction2 = create(:transaction, result: "canceled")

      get :show, format: :json

      expect(response.status).to eq(200)
      transaction = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
