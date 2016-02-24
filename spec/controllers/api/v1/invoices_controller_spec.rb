require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe "GET #index" do
    it "returns all invoices in json" do
      invoice1 = create(:invoice)
      invoice2 = create(:invoice, status: "dead")


      get :index, format: :json
      invoices = JSON.parse(response.body)
      first_inv = invoices.first
      last_inv = invoices.last

      expect(response.status).to eq(200)
      expect("shipped").to eq(first_inv['status'])
      expect("dead").to eq(last_inv['status'])
      expect(invoices.count).to eq(2)
    end
  end

  describe "GET #show" do
    it "returns invoice with specified id in json" do
      invoice3 = create(:invoice)
      invoice4 = create(:invoice, status: "dead")
      get :show, id: invoice3.id, format: :json

      parsed_item = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect("shipped").to eq(parsed_item['status'])
      expect(invoice3.id).to eq(parsed_item['id'])
    end
  end
end
