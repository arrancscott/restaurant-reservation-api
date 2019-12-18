# frozen_string_literal: true

require 'rails_helper'

describe V1::GuestsController do
  before(:each) do
    set_auth_headers
  end

  it 'returns a guest' do
    restaurant = create(:restaurant, :with_guest)
    guest = restaurant.guests.first
    get :show, params: { restaurant_id: restaurant.id, id: guest.id }
    expect(json['first_name']).to eq(guest.first_name)
    expect(json['last_name']).to eq(guest.last_name)
  end

  it 'updates a guest' do
    restaurant = create(:restaurant, :with_guest)
    guest = restaurant.guests.first
    put :update, params: { restaurant_id: restaurant.id, id: guest.id, "guest": {
      "first_name": 'Mickey',
      "last_name": 'Mouse'
    } }
    expect(json['first_name']).to eq('Mickey')
    expect(json['last_name']).to eq('Mouse')
  end

  it 'creates a guest' do
    restaurant = create(:restaurant)
    post :create, params: { restaurant_id: restaurant.id, "guest": {
      "first_name": 'Mickey',
      "last_name": 'Mouse',
      "phone": '12345',
      "email": 'mickey.mouse@disney.com'
    } }
    expect(json['email']).to eq('mickey.mouse@disney.com')
  end

  it 'deletes a guest' do
    restaurant = create(:restaurant, :with_guest)
    guest = restaurant.guests.first
    delete :destroy, params: { restaurant_id: restaurant.id, id: guest.id }
    expect(Guest.count).to eq(0)
  end
end
