class RemoveRoomFromGame < ActiveRecord::Migration[7.2]
  def change
    remove_reference :games, :room
  end
end
