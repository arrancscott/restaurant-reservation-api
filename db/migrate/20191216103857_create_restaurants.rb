# frozen_string_literal: true

class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :cuisines
      t.string :phone
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
