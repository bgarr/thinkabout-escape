# frozen_string_literal: true

class Puzzle < ApplicationRecord
  belongs_to :item, dependent: :nullify
end
