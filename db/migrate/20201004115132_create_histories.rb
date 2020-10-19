class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
