class Api::V1::Items::MostBySoldController < ApplicationController
  respond_to :json

  def index
    top_list = params[:quantity].to_i
    succ_invoices = Invoice.all.joins(:transactions).
                                where(transactions: { result: "success" }).
                                joins(:invoice_items).
                                order("sum(quantity) desc").
                                group(:item_id).
                                sum(:quantity).to_a

    top_item_ids = succ_invoices[0..(top_list-1)]

    top_items = top_item_ids.map do |arr|
      Item.find(arr[0])
    end

    respond_with top_items
  end

end
