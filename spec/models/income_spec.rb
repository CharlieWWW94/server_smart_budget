require 'rails_helper'

RSpec.describe Income, type: :model do
  it "is valid when includes valid attributes (income_type, annual / month, user_id" do
    income_user = User.new({username: "Income test user", pw_hash: "123"})
    income_user.save
    valid_income = Income.new({income_type: "Fixed", annual: 20000, user_id: income_user.id})
    expect(valid_income).to be_valid
    income_user.destroy
  end

  it "is not valid when does not include income_type" do
    income_user = User.new({username: "Income test user", pw_hash: "123"})
    income_user.save
    invalid_income = Income.new({annual: 20000, user_id: income_user.id})
    expect(invalid_income).to_not be_valid
    income_user.destroy
  end

  it "is not valid when does not include user_id" do
    income_user = User.new({username: "Income test user", pw_hash: "123"})
    income_user.save
    invalid_income = Income.new({income_type: "Fixed"})
    expect(invalid_income).to_not be_valid
    income_user.destroy
  end

  it "can access parent model in DB" do
    income_user = User.new({username: "Income test user", pw_hash: "123"})
    income_user.save
    valid_income = Income.new({income_type: "Fixed", annual: 20000, user_id: income_user.id})
    puts valid_income.user
    expect(valid_income.user.username).to eq("Income test user")
  end
end
