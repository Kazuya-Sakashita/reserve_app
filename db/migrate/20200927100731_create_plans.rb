class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :order
      t.integer :price
      t.datetime :time
      t.text :time_block
      t.text :description
      t.timestamps
    end
  end
end
