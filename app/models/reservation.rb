class Reservation < ApplicationRecord
  belongs_to :user #=>userに従属する
end
