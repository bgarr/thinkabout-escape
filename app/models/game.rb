# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :owner, class_name: 'User'
end
