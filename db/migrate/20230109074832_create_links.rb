class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.text :title
      t.text :url

      t.timestamps
    end
  end
end
