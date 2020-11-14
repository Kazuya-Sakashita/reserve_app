class Reservation < ApplicationRecord
  belongs_to :user #=>userに従属する
  default_scope -> { order(appointed_day: :desc) }#施術日を降順に並び替える
  belongs_to :plan
end