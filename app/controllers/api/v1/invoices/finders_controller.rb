class Api::V1::Invoices::FindersController < ApplicationController
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
        respond_with Invoice.find(params[:id])
      elsif params[:status]
        respond_with Invoice.find_by(status: params[:status])
      elsif params[:customer_id]
        respond_with Invoice.find_by(customer_id: params[:customer_id])
      elsif params[:merchant_id]
        respond_with Invoice.find_by(merchant_id: params[:merchant_id])
      elsif params[:created_at]
        respond_with Invoice.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Invoice.find_by(updated_at: params[:updated_at])
      end
    end

    def find_all_params
      if params[:id]
        respond_with Invoice.where(id: params[:id])
      elsif params[:status]
        respond_with Invoice.where(status: params[:status])
      elsif params[:customer_id]
        respond_with Invoice.where(customer_id: params[:customer_id])
      elsif params[:merchant_id]
        respond_with Invoice.where(merchant_id: params[:merchant_id])
      elsif params[:created_at]
        respond_with Invoice.where(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Invoice.where(updated_at: params[:updated_at])
      end
    end
end
