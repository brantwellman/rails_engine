class Api::V1::Transactions::FindersController < ApplicationController
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
        respond_with Transaction.find(params[:id])
      elsif params[:result]
        respond_with Transaction.find_by('LOWER(result) = ?', params[:result].downcase)
      elsif params[:invoice_id]
        respond_with Transaction.find_by(invoice_id: params[:invoice_id])
      elsif params[:credit_card_number]
        respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
      elsif params[:credit_card_expiration_date]
        respond_with Transaction.find_by(credit_card_expiration_date: params[:credit_card_expiration_date])
      elsif params[:created_at]
        respond_with Transaction.find_by(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Transaction.find_by(updated_at: params[:updated_at])
      end
    end

    def find_all_params
      if params[:id]
        respond_with Transaction.where(id: params[:id])
      elsif params[:result]
        respond_with Transaction.where('LOWER(result) = ?', params[:result].downcase)
      elsif params[:invoice_id]
        respond_with Transaction.where(invoice_id: params[:invoice_id])
      elsif params[:credit_card_number]
        respond_with Transaction.where(credit_card_number: params[:credit_card_number])
      elsif params[:credit_card_expiration_date]
        respond_with Transaction.where(credit_card_expiration_date: params[:credit_card_expiration_date])
      elsif params[:created_at]
        respond_with Transaction.where(created_at: params[:created_at])
      elsif params[:updated_at]
        respond_with Transaction.where(updated_at: params[:updated_at])
      end
    end
end
