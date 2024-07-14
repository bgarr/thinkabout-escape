# frozen_string_literal: true

class AddRoomToGames < ActiveRecord::Migration[7.1]
  def change
    add_reference :games, :room
  end
end
