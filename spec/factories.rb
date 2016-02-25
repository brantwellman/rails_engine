require 'faker'

FactoryGirl.define do

  factory :customer do
    first_name
    last_name
    created_at "2012-03-27 14:54:09"
    updated_at "2012-03-27 14:54:09"
  end

  sequence :first_name do |n|
    "#{Faker::Name.first_name}"
  end

  sequence :last_name do |n|
    "#{Faker::Name.last_name}"
  end

  factory :merchant do
    name
    created_at "2012-03-27 14:53:59"
    updated_at "2012-03-27 14:53:59"
  end

  sequence :name do |n|
    "#{Faker::Company.name}"
  end

  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence
    unit_price Faker::Number.number(5)
    merchant
    created_at "2012-03-27 14:53:59"
    updated_at "2012-03-27 14:53:59"
  end

  factory :invoice_item do
    item
    invoice
    quantity 2
    unit_price 2
    created_at "2012-03-27 14:54:09"
    updated_at "2012-03-27 14:54:09"
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Lorem.word
    result "success"
    created_at "2012-03-27 14:54:09"
    updated_at "2012-03-27 14:54:09"
  end

  factory :invoice do
    status "shipped"
    customer
    merchant
    created_at "2012-03-25 09:54:09"
    updated_at "2012-03-25 09:54:09"
  end


end
