class Api::V1::Transactions::FindersController < ApplicationController
  respond_to :json

  def show
    transactions = Transaction.where(transaction_params)
    unless transaction_name_params.empty?
      respond_with transactions.find_by(build_query)
    else
      respond_with transactions.first
    end
  end

  def index
    transactions = Transaction.where(transaction_params)
    unless transaction_name_params.empty?
      respond_with transactions.where(build_query)
    else
      respond_with transactions
    end
  end

  private

    def build_query
      query = []
      query << "result ILIKE '#{transaction_name_params[:result]}'" if transaction_name_params[:result]
    end

    def transaction_params
      params.permit(:id, :invoice_id, :credit_card_number, :created_at, :updated_at)
    end

    def transaction_name_params
      params.permit(:result)
    end
end
