class RenameContactColumnToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :contact, :phone_number
  end
end
