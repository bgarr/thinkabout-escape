# frozen_string_literal: true

class GameRoom < ApplicationRecord
  belongs_to :game
  belongs_to :room

  def self.ransackable_associations(_auth_object = nil)
    %w[game room]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at game_id id room_id updated_at]
  end
end
