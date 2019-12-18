# frozen_string_literal: true

class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
