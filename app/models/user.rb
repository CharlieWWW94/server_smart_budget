class User < ApplicationRecord
    has_many :budgets, dependent: :destroy
    has_many :incomes, dependent: :destroy
end
