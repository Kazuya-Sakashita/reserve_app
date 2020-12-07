class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.integer :staff_id
      t.text :staff_block


      t.timestamps
    end
  end
end
