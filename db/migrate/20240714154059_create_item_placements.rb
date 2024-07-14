# frozen_string_literal: true

class CreateItemPlacements < ActiveRecord::Migration[7.1]
  def change
    create_table :item_placements, id: :uuid do |t|
      t.references :game, null: false
      t.references :item_slot, null: false

      t.timestamps
    end
  end
end
