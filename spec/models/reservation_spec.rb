# frozen_string_literal: true

require 'rails_helper'

describe Reservation do
  context 'when status is requested' do
    it 'returns true when requested? is called' do
      reservation = build(:reservation, :requested)
      expect(reservation.requested?).to eq(true)
    end
  end

  context 'when status is pending' do
    it 'returns true when pending? is called' do
      reservation = build(:reservation, :pending)
      expect(reservation.pending?).to eq(true)
    end
  end

  context 'when status is booked' do
    it 'returns true when booked? is called' do
      reservation = build(:reservation, :booked)
      expect(reservation.booked?).to eq(true)
    end
  end

  context 'when status is ended' do
    it 'returns true when ended? is called' do
      reservation = build(:reservation, :ended)
      expect(reservation.ended?).to eq(true)
    end
  end

  context 'when status is cancelled' do
    it 'returns true when cancelled? is called' do
      reservation = build(:reservation, :cancelled)
      expect(reservation.cancelled?).to eq(true)
    end
  end
end
