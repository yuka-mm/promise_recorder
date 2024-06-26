# frozen_string_literal: true

class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards do |t|
      t.references :payday, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.string :body, null: false
      t.integer :pieces
      t.integer :pt_range
      t.string :pt_addition

      t.timestamps
    end
  end
end
