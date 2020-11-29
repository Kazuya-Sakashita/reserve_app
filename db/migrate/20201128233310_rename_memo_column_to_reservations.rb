class RenameMemoColumnToReservations < ActiveRecord::Migration[5.1]
  def change
        rename_column :reservations, :memo, :status
  end
end
