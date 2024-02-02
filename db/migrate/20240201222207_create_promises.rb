class CreatePromises < ActiveRecord::Migration[7.1]
  def change
    create_table :promises do |t|
      t.references :child, null: false, foreign_key: true
      t.references :reward, null: false, foreign_key: true
      t.string :description, null: false
      t.boolean :completed
      t.datetime :start_time
      t.boolean :monthly_flag
      t.integer :frequency
      t.integer :points

      t.timestamps
    end
  end
end
