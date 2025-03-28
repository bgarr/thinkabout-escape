# frozen_string_literal: true

ActiveAdmin.register GameRoom do
  permit_params :game_id, :room_id
end
