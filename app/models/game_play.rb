# frozen_string_literal: true

class GamePlay < ApplicationRecord
  belongs_to :game
  belongs_to :player, class_name: 'User'

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at game_id id id_value player_id solution_state updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[game player]
  end
end
