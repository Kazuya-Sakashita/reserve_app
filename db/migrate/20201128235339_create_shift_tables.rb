class CreateShiftTables < ActiveRecord::Migration[5.1]
  def change
    create_table :shift_tables do |t|
      t.integer :staff_id
      t.string :staff_block

      t.timestamps
    end
  end
end
