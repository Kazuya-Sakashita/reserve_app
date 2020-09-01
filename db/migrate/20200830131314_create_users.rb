class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :password_digest
      t.date :birthday
      t.string :contact
      t.string :mail
      t.string :etc

      t.timestamps
    end
  end
end
