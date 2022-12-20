class Budget < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user
    has_many :budget_items, dependent: :destroy
    accepts_nested_attributes_for :budget_items
end
