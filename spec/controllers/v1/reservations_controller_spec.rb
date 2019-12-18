# frozen_string_literal: true

require 'rails_helper'

describe V1::ReservationsController do
  before(:each) do
    set_auth_headers
  end

  it 'returns a reservation' do
    restaurant = create(:restaurant, :with_guest_and_reservation)
    guest = restaurant.guests.first
    reservation = restaurant.reservations.first
    get :show, params: { restaurant_id: restaurant.id, guest_id: guest.id, id: reservation.id }
    expect(json['status']).to eq(reservation.status)
  end

  it 'updates a restaurant' do
    restaurant = create(:restaurant, :with_guest_and_reservation)
    guest = restaurant.guests.first
    reservation = restaurant.reservations.first
    put :update, params: { restaurant_id: restaurant.id, guest_id: guest.id, id: reservation.id, "reservation": {
      "covers": '10'
    } }
    expect(json['covers']).to eq(10)
  end

  it 'creates a restaurant' do
    restaurant = create(:restaurant, :with_guest)
    guest = restaurant.guests.first
    post :create, params: { restaurant_id: restaurant.id, guest_id: guest.id, "reservation": {
      "status": 'pending',
      "start_time": '1576578362',
      "covers": '2',
      "notes": "I'm a cartoon character so I can't eat real food"
    } }
    expect(json['status']).to eq('pending')
    expect(json['start_time']).to eq('2019-12-17T10:26:02.000Z')
    expect(json['covers']).to eq(2)
    expect(json['notes']).to eq("I'm a cartoon character so I can't eat real food")
  end

  it 'deletes a restaurant' do
    restaurant = create(:restaurant, :with_guest_and_reservation)
    guest = restaurant.guests.first
    reservation = restaurant.reservations.first
    restaurant = create(:restaurant)
    delete :destroy, params: { restaurant_id: restaurant.id, guest_id: guest.id, id: reservation.id }
    expect(Reservation.count).to eq(0)
  end
end
