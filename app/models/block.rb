class Block < ApplicationRecord
  has_many :reservations
  has_many :users
end
