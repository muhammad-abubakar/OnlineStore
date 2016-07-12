FactoryGirl.define do
  factory :admin_role, class: Role do
    name Role::ADMIN
  end

  factory :user_role, class: Role do
    name Role::USER
  end

  factory :guest_role, class: Role do
    name Role::GUEST
  end
end