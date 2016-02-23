require 'faker'

FactoryGirl.define do

  factory :customer do
    first_name
    last_name
  end

  sequence :first_name do |n|
    "#{Faker::Name.first_name}"
  end

  sequence :last_name do |n|
    "#{Faker::Name.last_name}"
  end

  factory :merchant do
    name Faker::Company.name
  end

  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence
    unit_price Faker::Number.number(5)
    merchant nil
  end

  factory :invoice_item do
    item nil
    invoice nil
    quantity 1
    unit_price 1
  end
  factory :transaction do
    invoice nil
    credit_card_number "MyString"
    credit_card_expiration_date "MyString"
    result "MyString"
  end
  factory :invoice do
    status "MyString"
    customer nil
    merchant nil
  end


end
