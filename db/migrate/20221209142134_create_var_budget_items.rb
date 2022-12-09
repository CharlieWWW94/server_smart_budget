class CreateVarBudgetItems < ActiveRecord::Migration[7.0]
  def change
    create_table :var_budget_items do |t|
      t.string :name
      t.float :min
      t.float :max
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
