require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, type: :controller do

  describe "GET #show" do
    it "returns a random customer" do
      customer1 = Customer.create(first_name: "name1", last_name: "last1")
      customer2 = Customer.create(first_name: "name2", last_name: "last2")

      get :show, format: :json

      expect(response.status).to eq(200)
      customer = JSON.parse(response.body)
      # binding.pry

      # expect(1).to eq(customer.count)
    end
  end

end
