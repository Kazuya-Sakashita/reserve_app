class CreateTimeBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :time_blocks do |t|
      t.text :time_block

      t.timestamps
    end
  end
end
