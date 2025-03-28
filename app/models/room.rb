# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :owner, class_name: 'User'

  has_many :game_rooms, dependent: :nullify
  has_many :games, through: :game_rooms
  has_one_attached :model_file
  has_many :paths, inverse_of: :room, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    ['owner']
  end
end
