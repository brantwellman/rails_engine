class Api::V1::InvoicesTransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find(params[:id]).transactions
  end

end
