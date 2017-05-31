FactoryGirl.define do
  factory :order_item do
    association :item, factory: :item
    association :order, factory: :order
  end
end
