# frozen_string_literal: true

class AddMonthlyPointsToChildren < ActiveRecord::Migration[7.1]
  def change
    add_column :children, :monthly_points, :integer
  end
end
