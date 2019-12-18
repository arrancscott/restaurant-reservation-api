# frozen_string_literal: true

class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy
  belongs_to :restaurant

  validates :first_name, :last_name, :phone, :email, presence: true
end
