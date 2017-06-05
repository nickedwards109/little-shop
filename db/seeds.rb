require 'faker'

User.create(name: 'admin', username: 'admin', password: 'admin', role: 'admin')
user = User.create(name: 'Harry Potter', username: 'hpotter', password: 'password')

10.times do
  Category.create(title: Faker::Commerce.department)
end

Category.all.each do |category|
  40.times do
    category.items.create(
      title: Faker::Commerce.product_name, description: Faker::Hipster.paragraph,
      price: Faker::Commerce.price, image_file_name: 'image.png',
      image_content_type: 'image/png', image_file_size: 20000,
      image_updated_at: DateTime.now
    )
  end
end

3.times do
  user.addresses.create(
    street_address: Faker::Address.street_address,
    street_address2: Faker::Address.secondary_address,
    city: Faker::Address.city, state: Faker::Address.state,
    zip_code: Faker::Address.zip
    )
end

20.times do
  order = user.orders.create(status: rand(0..3))

  10.times do
    item = Item.find(rand(1..Item.count))
    order.items.append(item)
  end
end