class Api::V1::MerchantFindersController < ApplicationController
  respond_to :json

  def show
    find_params
  end

  def index
    find_all_params
  end

  private

    def find_params
      if params[:id]
        respond_with Merchant.find(params[:id])
      elsif params[:name]
        respond_with Merchant.where('Lower(name) = ?', params[:name].downcase)
      elsif params[:created_at]
        respond_with Merchant.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Merchant.find_by(updated_at: params[:created_at])
      end
    end

    def find_all_params
      if params[:id]
        respond_with Merchant.find(params[:id])
      elsif params[:name]
        respond_with Merchant.where('Lower(name) = ?', params[:name].downcase)
      elsif params[:created_at]
        respond_with Merchant.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Merchant.find_by(updated_at: params[:created_at])
      end
    end
end
