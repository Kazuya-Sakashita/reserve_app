class Reservation < ApplicationRecord
  belongs_to :user
  default_scope -> { order(reservation_date: :desc) }#施術日を降順に並び替える
  belongs_to :plan
end