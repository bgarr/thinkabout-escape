# frozen_string_literal: true

class Puzzle < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id logic name updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end
end
