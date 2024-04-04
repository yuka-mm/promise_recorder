# frozen_string_literal: true

class RenamePromiseRewardsToPromiseCounts < ActiveRecord::Migration[7.1]
  def change
    rename_table :promise_rewards, :counts
  end
end
