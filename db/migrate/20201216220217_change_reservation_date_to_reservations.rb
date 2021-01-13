class ChangeReservationDateToReservations < ActiveRecord::Migration[5.1]
  def change
    change_column :reservations, :reservation_date, :date
  end
end
