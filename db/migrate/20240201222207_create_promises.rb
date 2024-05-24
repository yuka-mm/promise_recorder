# frozen_string_literal: true

class CreatePromises < ActiveRecord::Migration[7.1]
  def change
    create_table :promises do |t|
      t.references :child, null: false, foreign_key: true
      t.string :description, null: false
      t.integer :day_of_week
      t.datetime :start_day
      t.boolean :monthly_flag
      t.integer :frequency
      t.integer :points

      t.timestamps
    end
  end
end
