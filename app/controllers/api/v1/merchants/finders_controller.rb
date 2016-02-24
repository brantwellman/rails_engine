class Api::V1::Merchants::FindersController < ApplicationController
  respond_to :json

  def show
    merchants = Merchant.where(merchant_params)
    unless merchant_name_params.empty?
      respond_with merchants.find_by(build_query)
    else
      respond_with merchants.first
    end
  end

  def index
    merchants = Merchant.where(merchant_params)
    unless merchant_name_params.empty?
      respond_with merchants.where(build_query)
    else
      respond_with merchants
    end
  end

  private

    def build_query
      query = []
      query << "name ILIKE '#{merchant_name_params[:name]}'" if merchant_name_params[:name]
    end

    def merchant_params
      params.permit(:created_at, :id, :updated_at)
    end

    def merchant_name_params
      params.permit(:name)
    end

end
