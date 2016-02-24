class Api::V1::Customers::FindersController < ApplicationController
  respond_to :json

  def show
    customers = Customer.where(customer_params)
    unless customer_name_params.empty?
      respond_with customers.find_by(build_query)
    else
      respond_with customers.first
    end
  end

  def index
    customers = Customer.where(customer_params)
    unless customer_name_params.empty?
      respond_with customers.where(build_query)
    else
      respond_with customers
    end
  end

  private

    def build_query
      query = []
      query << "first_name ILIKE '#{customer_name_params[:first_name]}'" if customer_name_params[:first_name]
      query << "last_name ILIKE '#{customer_name_params[:last_name]}'" if customer_name_params[:last_name]
      # [ :first_name,
      #   :last_name
      # ].each do |field|
      #   query << "#{field.to_s} ILIKE '#{customer_name_params[field]}'" if customer_name_params[field]
      # end
      query.join(" AND ")
    end

    def customer_params
      params.permit(:created_at, :id, :updated_at)
    end

    def customer_name_params
      params.permit(:first_name, :last_name)
    end
end
