class CreatePromiseRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :promise_rewards do |t|
      t.references :promise, null: false, foreign_key: true
      t.boolean :completed, default: false
      t.date :start_time

      t.timestamps
    end
  end
end
