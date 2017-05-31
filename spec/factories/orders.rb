FactoryGirl.define do
  factory :order do
    association :user, factory: :user

    status "ordered"
  end
end
