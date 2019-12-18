# frozen_string_literal: true

class CreateOpeningTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :opening_times do |t|
      t.integer :day_of_week
      t.string :opening_time
      t.string :closing_time
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
