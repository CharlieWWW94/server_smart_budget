class Budget < ApplicationRecord
    belongs_to :user
    has_many :budget_items, dependent: :destroy
    has_many :var_budget_items, dependent: :destroy
    accepts_nested_attributes_for :budget_items
end
