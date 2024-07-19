# frozen_string_literal: true

class CreateLinktreeCustomizations < ActiveRecord::Migration[7.0]
  def change
    create_table :linktree_customizations do |t|
      t.string :theme
      t.string :background_color
      t.string :link_shape
      t.string :link_color
      t.string :link_font_color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
