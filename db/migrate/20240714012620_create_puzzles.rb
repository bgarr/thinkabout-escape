# frozen_string_literal: true

class CreatePuzzles < ActiveRecord::Migration[7.1]
  def change
    create_table :puzzles do |t|
      t.string :name
      t.string :logic

      t.timestamps
    end
  end
end
