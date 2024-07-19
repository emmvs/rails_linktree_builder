# frozen_string_literal: true

class AddUserToLinks < ActiveRecord::Migration[7.0]
  def change
    add_reference :links, :user, null: false, foreign_key: true
  end
end
