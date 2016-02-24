require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random invoice" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: "dead")

      get :show, format: :json

      expect(response.status).to eq(200)
      invoice = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
