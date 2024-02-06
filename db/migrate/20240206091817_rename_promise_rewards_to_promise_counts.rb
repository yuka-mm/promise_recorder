class RenamePromiseRewardsToPromiseCounts < ActiveRecord::Migration[7.1]
  def change
    rename_table :promise_rewards, :promise_counts
  end
end
