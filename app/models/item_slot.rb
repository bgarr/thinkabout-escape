# frozen_string_literal: true

class ItemSlot < ApplicationRecord
  has_one :item, dependent: :nullify
  belongs_to :path, dependent: :destroy
end
