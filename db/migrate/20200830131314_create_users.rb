class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
      t.string :password_digest
      t.date :birthday
      t.string :phone_number
      t.string :email
      t.string :etc
      t.integer :admin


      t.timestamps
    end
  end
end
