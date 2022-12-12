class RemoveTypeFromIncomes < ActiveRecord::Migration[7.0]
  def change
    remove_column :incomes, :type, :string
    add_column :incomes, :income_type, :string
  end
end
