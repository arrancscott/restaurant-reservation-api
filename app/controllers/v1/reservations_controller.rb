# frozen_string_literal: true

module V1
  class ReservationsController < ApplicationController
    before_action :set_reservation, except: :create
    before_action :parse_start_time, only: %i[update create]

    authorize_resource

    def show
      json_response(@reservation)
    end

    def update
      @reservation.update(reservation_params)
      json_response(@reservation)
    end

    def create
      guest = Guest.find(params[:guest_id])
      json_response(guest.create_reservation!(reservation_params.merge(restaurant_id: params[:restaurant_id])))
    end

    def destroy
      json_response(@reservation.destroy)
    end

    private

    def reservation_params
      params.require(:reservation).permit(:status, :start_time, :covers, :notes)
    end

    def parse_start_time
      return unless params[:reservation][:start_time].is_a?(String)

      params[:reservation][:start_time] = Time.at(params[:reservation][:start_time].to_i).to_datetime
    end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  end
end
