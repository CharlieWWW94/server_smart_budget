class User < ApplicationRecord
    has_many :budgets, class_name: "Budget", dependent: :destroy
    has_many :incomes, class_name: "Income", dependent: :destroy
end
