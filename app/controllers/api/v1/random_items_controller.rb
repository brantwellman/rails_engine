class Api::V1::RandomItemsController < ApplicationController
  respond_to :json

  def show
    num = rand(Item.count)
    respond_with Item.offset(num).first
  end

end
