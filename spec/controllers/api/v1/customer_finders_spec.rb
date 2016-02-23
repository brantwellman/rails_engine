require 'rails_helper'

RSpec.describe Api::V1::CustomerFindersController, type: :controller do

  describe "GET #show" do
    it "returns the one customer with the given attribute" do
      customer1 = Customer.create(first_name: "name1", last_name: "last1")
      customer2 = Customer.create(first_name: "name2", last_name: "last2")

      get :show, id: customer1.id, format: :json

      expect(response.status).to eq(200)
      customer =  JSON.parse(response.body)

      expect("name1").to eq(customer['first_name'])

      get :show, first_name: customer2.first_name, format: :json
      customer =  JSON.parse(response.body)

      expect("name2").to eq(customer['first_name'])
    end
  end

  describe "GET #index" do
    it "returns the one customer with the given attribute" do
      customer1 = Customer.create(first_name: "name1", last_name: "last1")
      customer2 = Customer.create(first_name: "name1", last_name: "last2")
      customers = [customer1, customer2]

      get :index, id: customer1.id, format: :json
      expect(response.status).to eq(200)
      customer =  JSON.parse(response.body)

      expect("name1").to eq(customer['first_name'])

      get :index, first_name: "name1", format: :json
      customers = JSON.parse(response.body)

      expect(customers.count).to eq(2)

      first_cust = customers.first
      last_cust = customers.last

      expect(response.status).to eq(200)
      expect(customer1.id).to eq(first_cust['id'])
      expect(customer2.id).to eq(last_cust['id'])
    end
  end
end
