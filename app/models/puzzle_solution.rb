# frozen_string_literal: true

class PuzzleSolution < ApplicationRecord
  belongs_to :game_play
  belongs_to :puzzle
end
