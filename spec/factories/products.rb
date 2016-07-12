require 'faker'

FactoryGirl.define do
  factory :product do
    name { Faker::Name.name }
    unit_price 10.0 
    quantity  10
    association :user, factory: :user
  end
end