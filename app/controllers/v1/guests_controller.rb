# frozen_string_literal: true

module V1
  class GuestsController < ApplicationController
    before_action :set_guest, except: :create

    authorize_resource

    def show
      json_response(@guest)
    end

    def update
      @guest.update(guest_params)
      json_response(@guest)
    end

    def create
      restaurant = Restaurant.find(params[:restaurant_id])
      json_response(restaurant.guests.create!(guest_params))
    end

    def destroy
      json_response(@guest.destroy)
    end

    private

    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :email)
    end

    def set_guest
      @guest = Guest.find(params[:id])
    end
  end
end
