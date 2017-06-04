require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

5.times do
  order = user.orders.create

  10.times do
    item = Item.find(rand(1..Item.count))
    order.items.append(item)
  end
end