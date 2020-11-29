class AddreservationBlockNumberToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :reservation_block_number, :string
  end
end
