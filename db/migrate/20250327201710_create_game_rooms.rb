class CreateGameRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :game_rooms, id: :uuid do |t|
      t.references :game, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
