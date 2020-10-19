class AddPlanIdToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :plan_id, :string
  end
end
