class CreateBudgetItems < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_items do |t|
      t.string :name
      t.float :value
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
