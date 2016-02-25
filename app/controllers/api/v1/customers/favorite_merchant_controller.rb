class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    id = Customer.new.merchant_id(params[:id])

    respond_with Merchant.find(id)
  end

end
