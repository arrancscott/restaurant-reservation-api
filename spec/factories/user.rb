# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { 'admin' }
    trait :restaurant do
      role { 'restaurant' }
    end
    trait :guest do
      role { 'guest' }
    end
  end
end
