# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    status { Reservation.statuses.keys.sample }
    start_time { DateTime.now }
    covers { rand(1..10) }
    notes { Faker::Lorem.sentence }
    trait :requested do
      status { 'requested' }
    end
    trait :pending do
      status { 'pending' }
    end
    trait :booked do
      status { 'booked' }
    end
    trait :ended do
      status { 'ended' }
    end
    trait :cancelled do
      status { 'cancelled' }
    end
  end
end
