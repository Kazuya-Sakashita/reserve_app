class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.date :closed_day

      t.timestamps
    end
  end
end
