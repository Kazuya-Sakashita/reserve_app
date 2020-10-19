class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :user_id
      t.string :event_id
      t.datetime :appointed_day

      t.timestamps
    end
  end
end
