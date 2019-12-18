# frozen_string_literal: true

class Restaurant < ApplicationRecord
  has_many :guests, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :opening_times, dependent: :destroy

  accepts_nested_attributes_for :opening_times

  validates :name, :cuisines, :phone, :email, :location, presence: true

  serialize :cuisines

  CUISINES = %i[american chinese thai italian mexican indian japanese mediterranean turkish greek vegetarian
                vietnamese french spanish].freeze # There are others!

  def opening_times_attributes=(attrs)
    opening_times = attrs.map do |ot|
      opening_time = OpeningTime.find_or_initialize_by(day_of_week: ot[:day_of_week], restaurant_id: id)
      opening_time.update(opening_time: ot[:opening_time], closing_time: ot[:closing_time])
      opening_time
    end
    self.opening_times = opening_times
  end

  def cuisines
    self[:cuisines].map { |c| Restaurant::CUISINES[c].to_s.titleize }.join(', ')
  end

  def cuisines=(cuisines)
    self[:cuisines] = cuisines.split(', ').map { |c| Restaurant::CUISINES.find_index(c.downcase.to_sym) }.compact
  end
end
