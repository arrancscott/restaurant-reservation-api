# frozen_string_literal: true

class OpeningTime < ApplicationRecord
  belongs_to :restaurant

  enum day_of_week: %i[monday tuesday wednesday thursday friday saturday sunday]

  validates :day_of_week, :opening_time, :closing_time, presence: true
end
