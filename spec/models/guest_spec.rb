# frozen_string_literal: true

require 'rails_helper'

describe Guest do
  it 'cannot save unless all the required fields are present' do
    expect { described_class.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'can save when all the required fields are present' do
    restaurant = create(:restaurant)
    attrs = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone: Faker::PhoneNumber.phone_number,
      email: Faker::Internet.email,
      restaurant: restaurant
    }
    expect { described_class.create!(attrs) }.not_to raise_error(ActiveRecord::RecordInvalid)
  end
end
