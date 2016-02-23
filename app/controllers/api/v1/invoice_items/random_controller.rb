class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json

  def show
    num = rand(InvoiceItem.count)
    respond_with InvoiceItem.offset(num).first
  end

end
