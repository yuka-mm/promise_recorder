# frozen_string_literal: true

class AddColumnToParents < ActiveRecord::Migration[7.1]
  def change
    add_column :parents, :provider, :string
    add_column :parents, :uid, :string
    add_index :parents, %i[provider uid], unique: true
  end
end
