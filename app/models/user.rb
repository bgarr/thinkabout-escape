class User < ApplicationRecord
  has_many :games, inverse_of: :owner
end
