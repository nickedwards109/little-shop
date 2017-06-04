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

    inventory_status "in-stock"

    image_file_name "image.png"
    image_content_type "image/png"
    image_file_size 20000
    image_updated_at DateTime.now
  end
end
