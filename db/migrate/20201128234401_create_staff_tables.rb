class CreateStaffTables < ActiveRecord::Migration[5.1]
  def change
    create_table :staff_tables do |t|
      t.string :name

      t.timestamps
    end
  end
end
