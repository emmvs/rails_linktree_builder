class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :text
    add_index :users, :username, unique: true
    add_column :users, :full_name, :text
    add_column :users, :body, :text
  end
end
