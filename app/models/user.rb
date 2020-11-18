class User < ApplicationRecord
    has_secure_password 
    validates :password, presence: true, length: { minimum: 6 }
    validates :mail, presence: true, uniqueness: true

    has_many :reservations
    has_many :plans, through: :reservations
    has_many :histories

end
