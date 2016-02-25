class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def merchant_id(id)
    customer_frequencies = Customer.find(id).invoices.joins(:transactions).
                           where(transactions: { result: "success"}).
                           group(:merchant_id).count

    customer_frequencies.max_by { |k,v| v }.first
  end

  def random
    num = rand(Customer.count)
    Customer.offset(num).first
  end
end
