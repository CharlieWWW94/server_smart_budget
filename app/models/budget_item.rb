class BudgetItem < ApplicationRecord
    validates :name, :value, :item_type, presence: true
    belongs_to :budget
end
