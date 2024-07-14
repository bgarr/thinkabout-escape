# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :text
      t.string :logic
      t.references :puzzle, null: true

      t.timestamps
    end
  end
end
