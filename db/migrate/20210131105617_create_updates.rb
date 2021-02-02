class CreateUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :updates do |t|
      t.date :date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
