class Income < ApplicationRecord
    validates :income_type, :user_id, presence: true
    belongs_to :user
end
