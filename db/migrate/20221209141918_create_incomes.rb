class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :type
      t.float :annual
      t.float :month
      t.float :week
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
