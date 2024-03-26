class CreateWeeks < ActiveRecord::Migration[7.1]
  def change
    create_table :weeks do |t|
      t.string :day_name

      t.timestamps
    end
  end
end
