FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "category #{n}"
    end
  end
end
