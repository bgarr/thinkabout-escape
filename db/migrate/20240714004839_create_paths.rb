# frozen_string_literal: true

class CreatePaths < ActiveRecord::Migration[7.1]
  def change
    create_table :paths do |t|
      t.string :name
      t.references :room, null: false
      t.jsonb :curve
      t.string :logic

      t.timestamps
    end
  end
end
