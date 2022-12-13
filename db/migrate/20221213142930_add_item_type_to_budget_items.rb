class AddItemTypeToBudgetItems < ActiveRecord::Migration[7.0]
  def change
    add_column :budget_items, :item_type, :string
    drop_table :var_budget_items
  end
end
