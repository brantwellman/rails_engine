class Api::V1::InvoiceItemsFindersController < ApplicationController
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
        respond_with InvoiceItem.find(params[:id])
      elsif params[:item_id]
        respond_with InvoiceItem.find_by(item_id: params[:item_id])
      elsif params[:invoice_id]
        respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id])
      elsif params[:quantity]
        respond_with InvoiceItem.find_by(quantity: params[:quantity])
      elsif params[:unit_price]
        respond_with InvoiceItem.find_by(unit_price: params[:unit_price])
      elsif params[:created_at]
        respond_with InvoiceItem.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with InvoiceItem.find_by(updated_at: params[:created_at])
      end
    end

    def find_all_params
      if params[:id]
        respond_with InvoiceItem.find(params[:id])
      elsif params[:item_id]
        respond_with InvoiceItem.where(item_id: params[:item_id])
      elsif params[:invoice_id]
        respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
      elsif params[:quantity]
        respond_with InvoiceItem.where(quantity: params[:quantity])
      elsif params[:unit_price]
        respond_with InvoiceItem.where(unit_price: params[:unit_price])
      elsif params[:created_at]
        respond_with InvoiceItem.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with InvoiceItem.find_by(updated_at: params[:created_at])
      end
    end
end
