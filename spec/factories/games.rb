# frozen_string_literal: true

FactoryBot.define do
  factory :game do
    name { "#{Faker::Game.title}-like Game" }
    owner factory: :user
  end
end
