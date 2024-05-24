# frozen_string_literal: true

class AddRoleToParents < ActiveRecord::Migration[7.1]
  def change
    add_column :parents, :role, :integer, default: 0, null: false
  end
end
