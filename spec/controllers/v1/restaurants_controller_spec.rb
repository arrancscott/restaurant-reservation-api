# frozen_string_literal: true

require 'rails_helper'

describe V1::RestaurantsController do
  before(:each) do
    set_auth_headers
  end

  it 'returns all restaurants' do
    5.times { create(:restaurant) }
    get :index
    expect(json.count).to eq(5)
  end

  it 'returns a restaurant and its opening times' do
    restaurant = create(:restaurant)
    get :show, params: { id: restaurant.id }
    expect(json['restaurant']['name']).to eq(restaurant.name)
  end

  it 'updates a restaurant' do
    restaurant = create(:restaurant)
    put :update, params: { id: restaurant.id, "restaurant": { "name": 'Updated Restaurant' } }
    expect(json['restaurant']['name']).to eq('Updated Restaurant')
  end

  it 'creates a restaurant' do
    post :create, params: {
      "restaurant": {
        "name": 'My Awesome Restaurant',
        "cuisines": 'American',
        "phone": '01234 56789',
        "email": 'my@email.com',
        "opening_times_attributes": [{ "day_of_week": 'monday', "opening_time": '12:00', "closing_time": '23:00' }],
        "location": 'Detroit'
      }
    }
    expect(json['restaurant']['name']).to eq('My Awesome Restaurant')
    expect(json['opening_times'].count).to eq(1)
  end

  it 'deletes a restaurant' do
    restaurant = create(:restaurant)
    delete :destroy, params: { id: restaurant.id }
    expect(Restaurant.count).to eq(0)
  end
end
