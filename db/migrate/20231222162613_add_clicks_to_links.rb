class AddClicksToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :click_count, :integer, default: 0
    add_column :links, :last_clicked_at, :datetime
  end
end
