class Plan < ApplicationRecord
  validates :order, presence: true
  validates :price, presence: true
  validates :time_block, presence: true

  has_many :reservations
  has_many :users, through: :reservations

end
