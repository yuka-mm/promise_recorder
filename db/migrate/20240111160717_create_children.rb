class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.references :parent, null: false, foreign_key: true
      t.string :name, null: false
      t.datetime :birth_date

      t.timestamps
    end
  end
end
