# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roles = [Role::ADMIN, Role::USER, Role::GUEST].collect do |name|
  Role.create!(name: name)
end

["admin@admin.com","user@user.com"].each_with_index do |email, i|
  User.create!(email: email, password: '123456', password_confirmation: '123456', name: "test_name#{i}", role: roles[i] )
end

["car","phone"].each do |name|
  product = Product.create!(user: User.first, name: name, quantity: 20, unit_price: 20.0)
  product.line_items.create!(price: 200, quantity: 20, user: User.second)
end

