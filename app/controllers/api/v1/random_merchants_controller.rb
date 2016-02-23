class Api::V1::RandomMerchantsController < ApplicationController
  respond_to :json

  def show
    num = rand(Merchant.count)
    respond_with Merchant.offset(num).first
  end

end
