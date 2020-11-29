class RenameAppointedDayColumnToReservations < ActiveRecord::Migration[5.1]
  def change
        rename_column :reservations, :appointed_day, :reservation_date
  end
end
