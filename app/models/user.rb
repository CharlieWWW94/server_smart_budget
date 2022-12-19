class User < ApplicationRecord
    validates :username, :pw_hash, presence: true
    has_many :budgets, class_name: "Budget", dependent: :destroy
    has_many :incomes, class_name: "Income", dependent: :destroy
end
