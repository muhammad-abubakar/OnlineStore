require 'faker'

FactoryGirl.define do
  factory :line_item do
    price 20.0
    quantity  5
    association :user,    factory: :user
    association :product, factory: :product
  end
end