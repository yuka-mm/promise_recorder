class AddEmailConfirmationTokenToParents < ActiveRecord::Migration[7.1]
  def change
    add_column :parents, :unconfirmed_email, :string
    add_column :parents, :email_confirmation_token, :string
  end
end
