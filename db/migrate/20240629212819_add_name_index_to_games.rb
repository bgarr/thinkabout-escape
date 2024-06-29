# frozen_string_literal: true

class AddNameIndexToGames < ActiveRecord::Migration[7.1]
  def change
    add_index :games, :name, unique: true
  end
end
