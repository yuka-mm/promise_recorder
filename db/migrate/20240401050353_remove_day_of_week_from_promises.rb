# frozen_string_literal: true

class RemoveDayOfWeekFromPromises < ActiveRecord::Migration[7.1]
  def change
    remove_column :promises, :day_of_week, :integer
  end
end
