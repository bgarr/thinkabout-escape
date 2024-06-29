# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    name { Faker::Name.first_name }
  end
end
