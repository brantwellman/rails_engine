class Api::V1::RandomInvoicesController < ApplicationController
  respond_to :json

  def show
    num = rand(Invoice.count)
    respond_with Invoice.offset(num).first
  end

end
