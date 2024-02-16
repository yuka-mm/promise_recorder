class AddColumnToParents < ActiveRecord::Migration[7.1]
  def change
      add_column :parents, :provider, :string
      add_column :parents, :uid, :string
      add_index :parents, [:provider, :uid], unique: true
  end
end
