class AddMemoToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :memo, :text
  end
end
