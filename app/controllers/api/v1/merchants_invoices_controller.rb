class Api::V1::MerchantsInvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find(params[:id]).invoices
  end

end
