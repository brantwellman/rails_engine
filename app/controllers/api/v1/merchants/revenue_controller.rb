class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      result = Merchant.find(params[:id]).invoices.
                                where(invoices: { created_at: params[:date]}).
                                joins(:transactions).
                                where(transactions: { result: "success" }).
                                joins(:invoice_items).
                                sum("quantity * unit_price")
      respond_with({revenue: result})
    else
      result = Merchant.find(params[:id]).invoices.
                                joins(:transactions).
                                where(transactions: { result: "success" }).
                                joins(:invoice_items).
                                sum("quantity * unit_price")

      respond_with({revenue: result})
    end
  end
end
