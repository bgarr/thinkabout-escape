# frozen_string_literal: true

class Path < ApplicationRecord
  belongs_to :room, dependent: :destroy
end
