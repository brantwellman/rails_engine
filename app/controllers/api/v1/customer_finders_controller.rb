class Api::V1::CustomerFindersController < ApplicationController
  respond_to :json

  def show
    find_params
  end

  def index
    find_all_params
  end

  private

    def find_all_params
      if params[:id]
        respond_with Customer.find(params[:id])
      elsif params[:first_name]
        respond_with Customer.where('LOWER(first_name) = ?', params[:first_name].downcase)
      elsif params[:last_name]
        respond_with Customer.where('LOWER(last_name) = ?', params[:last_name].downcase)
      elsif params[:created_at]
        respond_with Customer.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Customer.find_by(updated_at: params[:created_at])
      end
    end

    def find_params
      if params[:id]
        respond_with Customer.find(params[:id])
      elsif params[:first_name]
        respond_with Customer.find_by('LOWER(first_name) = ?', params[:first_name].downcase)
      elsif params[:last_name]
        respond_with Customer.find_by('LOWER(last_name) = ?', params[:last_name].downcase)
      elsif params[:created_at]
        respond_with Customer.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Customer.find_by(updated_at: params[:created_at])
      end
    end
end
