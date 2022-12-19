require 'rails_helper'

RSpec.describe Income, type: :model do
  it "is valid when includes valid attributes (income_type, annual / month, user_id" do
    income_user = User.new({username: "Income test user", pw_hash: "123"})
    income_user.save
    valid_income = Income.new({income_type: "Fixed", annual: 20000, user_id: income_user.id})
    expect(valid_income).to be_valid
    income_user.destroy
  end
end
