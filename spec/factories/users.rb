require 'faker'

FactoryGirl.define do

  factory :user, aliases: [:role_user] do
    name  Faker::Name.name 
    email Faker::Internet.email
    association :role, factory: :user_role
    age   20
    password '123456'
    password_confirmation '123456'
  end

  factory :admin, class: User do
    name  Faker::Name.name 
    email Faker::Internet.email
    association :role, factory: :admin_role
    age   20
    password '123456'
    password_confirmation '123456'
  end

  factory :guest, class: User do
    name  Faker::Name.name 
    email Faker::Internet.email
    age   20
    association :role, factory: :guest_role
    password '123456'
    password_confirmation '123456'
  end
end