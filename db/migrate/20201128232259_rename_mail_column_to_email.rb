class RenameMailColumnToEmail < ActiveRecord::Migration[5.1]
  def change
        rename_column :users, :mail, :email
  end
end
