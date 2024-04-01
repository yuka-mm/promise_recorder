class CreateWeeklies < ActiveRecord::Migration[7.1]
  def change
    create_table :weeklies do |t|
      t.references :promise, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
