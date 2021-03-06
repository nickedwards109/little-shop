require 'faker'

User.create(name: 'admin', username: 'admin', password: 'admin', role: 1)
user = User.create(name: 'Harry Potter', username: 'hpotter', password: 'password')
puts "Seeded Users"

10.times do
  Category.create(title: Faker::Commerce.department)
end

puts "Seeded categories"

Category.all.each do |category|
  40.times do
    category.items.create(
      title: Faker::Commerce.product_name,
      description: Faker::Hipster.paragraph,
      price: Faker::Commerce.price,
      image: Faker::LoremPixel.image("300x300", false, 'cats')
      )
  end
end

puts "Seeded Items"

3.times do
  user.addresses.create(
    street_address: Faker::Address.street_address,
    street_address2: Faker::Address.secondary_address,
    city: Faker::Address.city, state: Faker::Address.state,
    zip_code: Faker::Address.zip
    )
end
puts "Seeded Addresses"

20.times do
  order = user.orders.create(status: rand(0..3))

  10.times do
    item = Item.find(rand(1..Item.count))
    order.items.append(item)
  end
end

puts "Seeded Orders"
