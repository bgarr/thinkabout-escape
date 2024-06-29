# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users, inverse_of: :role, dependent: :nullify
  validates :name, uniqueness: true

  ADMIN = 'Admin'
  EDITOR = 'Editor'
end
