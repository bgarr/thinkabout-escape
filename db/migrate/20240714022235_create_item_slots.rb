# frozen_string_literal: true

class CreateItemSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :item_slots, id: :uuid do |t|
      t.references :path
      t.references :item
      t.float :path_location

      t.timestamps
    end
  end
end
