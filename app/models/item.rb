# frozen_string_literal: true

class Item < ApplicationRecord
  has_one :puzzle, optional: true, dependent: :nullify
  has_one_attached :model_file
end
