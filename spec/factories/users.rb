# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, '0')}@sample.com" }
    password { '123456' }
    password_confirmation { '123456' }
    role { Role.find_or_create_by!(name: Role::EDITOR) }

    trait :confirmed do
      confirmed_at { Time.zone.now }
    end

    trait :admin do
      role { Role.find_or_create_by!(name: Role::ADMIN) }
    end
  end
end
