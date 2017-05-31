FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "Person #{n}"
    end

    sequence :username do |n|
      "user#{n}"
    end

    password "password"
    
    role 0
  end
end
