class Api::V1::RandomTransactionsController < ApplicationController
  respond_to :json

  def show
    num = rand(Transaction.count)
    respond_with Transaction.offset(num).first
  end

end
