# frozen_string_literal: true

class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :msg
      t.references :parent, null: false, foreign_key: true
      t.boolean :check, default: false

      t.timestamps
    end
  end
end
