FactoryGirl.define do
  factory :address do
    association :user, factory: :user

    sequence :street_address do |n|
      "12#{n} Fake Street"
    end

    sequence :street_address2 do |n|
      "Apartment #{n}"
    end

    city "Denver"
    state "Colorado"
    zip_code 80202
  end
end
