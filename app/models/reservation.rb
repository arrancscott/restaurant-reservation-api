# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :guest
  belongs_to :restaurant

  validates :status, :start_time, :covers, presence: true

  enum status: %i[requested pending booked ended cancelled]
end
