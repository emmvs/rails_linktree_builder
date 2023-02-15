class AddSlugToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :slug, :text
    add_index :users, :slug, unique: true
  end
end
