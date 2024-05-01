# frozen_string_literal: true

class User < ApplicationRecord
  has_many :games, inverse_of: :owner, dependent: :destroy
end
