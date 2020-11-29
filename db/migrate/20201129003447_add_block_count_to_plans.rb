class AddBlockCountToPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :plans, :block_conut, :string
  end
end
