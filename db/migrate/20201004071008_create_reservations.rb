class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :staff_id
      t.integer :plan_id
      t.datetime :reservation_date
      t.text :reservation_block
      t.integer :status

      t.timestamps
    end
  end
end
