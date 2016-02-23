class Api::V1::RandomCustomersController < ApplicationController
  respond_to :json

  def show
    num = rand(Customer.count)
    respond_with Customer.offset(num).first
  end

end