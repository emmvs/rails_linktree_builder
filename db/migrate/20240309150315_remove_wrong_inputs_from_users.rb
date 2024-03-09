class RemoveWrongInputsFromUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string
    change_column :users, :username, :string
    change_column :users, :full_name, :string
    change_column :users, :encrypted_password, :string
    change_column :users, :reset_password_token, :string
    change_column :users, :slug, :string
  end
end
