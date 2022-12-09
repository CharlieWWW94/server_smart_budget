class Budget < ApplicationRecord
    belongs_to :user
    has_many :budget_items, dependent: :destroy
    has many :var_budget_items, dependent: :destroy
end
