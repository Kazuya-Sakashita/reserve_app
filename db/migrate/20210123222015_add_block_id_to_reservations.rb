class AddBlockIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :block_id, :integer
  end
end
