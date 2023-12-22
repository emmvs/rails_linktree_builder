class AddClickCountToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :click_count, :integer, default: 0
    add_column :links, :last_clicked_at, :datetime
    add_column :links, :user_agent, :string
    add_column :links, :device_type, :string
    add_column :links, :country, :string
    add_column :links, :city, :string
    add_index :links, :user_agent
    add_index :links, :country
    add_index :links, :city
  end
end
