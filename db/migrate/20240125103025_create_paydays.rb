class CreatePaydays < ActiveRecord::Migration[7.1]
  def change
    create_table :paydays do |t|
      t.references :parent, null: false, foreign_key: true
      t.references :child, null: false, foreign_key: true
      t.datetime :date
      t.datetime :week
      t.integer :action_type

      t.timestamps
    end
  end
end
