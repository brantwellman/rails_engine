class Api::V1::ItemFindersController < ApplicationController
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
        respond_with Item.find(params[:id])
      elsif params[:name]
        respond_with Item.find_by(name: params[:name])
      elsif params[:description]
        respond_with Item.find_by(description: params[:description])
      elsif params[:unit_price]
        respond_with Item.find_by(unit_price: params[:unit_price])
      elsif params[:merchant_id]
        respond_with Item.find_by(merchant_id: params[:merchant_id])
      elsif params[:created_at]
        respond_with Item.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Item.find_by(updated_at: params[:created_at])
      end
    end

    def find_all_params
      if params[:id]
        respond_with Item.find(params[:id])
      elsif params[:name]
        respond_with Item.where(name: params[:name])
      elsif params[:description]
        respond_with Item.where(description: params[:description])
      elsif params[:unit_price]
        respond_with Item.where(unit_price: params[:unit_price])
      elsif params[:merchant_id]
        respond_with Item.where(merchant_id: params[:merchant_id])
      elsif params[:created_at]
        respond_with Item.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Item.find_by(updated_at: params[:created_at])
      end
    end
end
