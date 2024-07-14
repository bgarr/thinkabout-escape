# frozen_string_literal: true

class CreateGamePlays < ActiveRecord::Migration[7.1]
  def change
    create_table :game_plays, id: :uuid do |t|
      t.references :game, null: false
      t.references :player, foreign_key: { to_table: :users }
      t.jsonb :solution_state

      t.timestamps
    end
  end
end
