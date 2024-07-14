# frozen_string_literal: true

class ItemPlacement < ApplicationRecord
  belongs_to :item_slot
  belongs_to :game
end
