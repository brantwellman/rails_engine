require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #index" do
    it "returns all customers in json" do
      customer1 = Customer.create(first_name: "name1", last_name: "last1")
      customer2 = Customer.create(first_name: "name2", last_name: "last2")

      get :index, format: :json
      customers = JSON.parse(response.body)
      first_cust = customers.first
      last_cust = customers.last

      expect(response.status).to eq(200)
      expect("name1").to eq(first_cust['first_name'])
      expect("last1").to eq(first_cust['last_name'])
      expect(customers.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns customer with specified id in json" do
      customer = Customer.create(first_name: "name1", last_name: "last1")

      get :show, id: customer.id, format: :json

      parsed_cust = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect('name1').to eq(customer['first_name'])
      expect('last1').to eq(customer['last_name'])
    end
  end
end
