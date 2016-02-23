class Api::V1::RandomInvoiceItemsController < ApplicationController
  respond_to :json

  def show
    num = rand(InvoiceItem.count)
    respond_with InvoiceItem.offset(num).first
  end

end
