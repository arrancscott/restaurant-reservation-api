# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :status
      t.datetime :start_time
      t.integer :covers
      t.string :notes
      t.integer :restaurant_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
