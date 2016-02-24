class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    frequencies = Customer.find(params[:id]).invoices.joins(:transactions).where(transactions: { result: "success"}).group(:merchant_id).count

    merchant_id = frequencies.max_by { |k,v| v }.first

    respond_with Merchant.find(merchant_id)
  end

end
