FactoryGirl.define do
  factory :item do
    association :category, factory: :category
    
    sequence :title do |n|
      "Item #{n}"
    end

    description "Magic Item"

    sequence :price do |n|
      "#{n}.#{n}"
    end

    stock_status "In Stock"
  end
end
