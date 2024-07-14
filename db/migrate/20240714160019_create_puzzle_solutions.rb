# frozen_string_literal: true

class CreatePuzzleSolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :puzzle_solutions, id: :uuid do |t|
      t.references :game_play, null: false
      t.references :puzzle, null: false
      t.jsonb :solution_state

      t.timestamps
    end
  end
end
