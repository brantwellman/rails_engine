class Api::V1::MerchantsItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).items
  end

end
