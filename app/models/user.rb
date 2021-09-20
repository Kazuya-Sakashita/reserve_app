class User < ApplicationRecord
  has_secure_password validations: false
  validate(on: :update) do |record|
    record.errors.add(:password, :blank) unless record.password_digest.present?
  end

  validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, on: :update
  validates_confirmation_of :password, allow_blank: true, on: :update
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_number, presence: true
  has_many :reservations
  has_many :plans, through: :reservations
end
