# frozen_string_literal: true

FactoryBot.define do
  factory :opening_time do
    day_of_week { rand(0..6) }
    opening_time { '09:00' }
    closing_time { '17:00' }
    trait :monday do
      day_of_week { 0 }
    end
    trait :tuesday do
      day_of_week { 1 }
    end
    trait :wednesday do
      day_of_week { 2 }
    end
    trait :thursday do
      day_of_week { 3 }
    end
    trait :friday do
      day_of_week { 4 }
    end
    trait :saturday do
      day_of_week { 5 }
    end
    trait :sunday do
      day_of_week { 6 }
    end
  end
end
