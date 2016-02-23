FactoryGirl.define do
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
  
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant nil
  end
  factory :customer do
    first_name "MyString"
    last_name "MyString"
  end
  factory :merchant do
    name "MyString"
  end
end
