# frozen_string_literal: true

class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.references :link, null: false, foreign_key: true
      t.string :user_agent
      t.string :device_type
      t.string :country
      t.string :city
      t.datetime :clicked_at

      t.timestamps
    end
    add_index :clicks, :country
  end
end
