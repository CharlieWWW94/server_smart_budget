require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    new_user = User.new({username: "test_user", pw_hash: "password", email: "testUser@email.com"})
    expect(new_user).to be_valid  
  end
  
  it "is not valid without username" do
  missing_username = User.new({username: nil, pw_hash: "password"})
  expect(missing_username).to_not be_valid
  end
  
  it "is not valid without pw_hash" do
  missing_pw = User.new({username: "missing_pw"})
  expect(missing_pw).to_not be_valid
  end

  it "can access child (income)" do
    new_user = User.new({username: "test_user", pw_hash: "password", email: "testUser@email.com"})
    new_user.save
    new_income = Income.new({income_type: "Fixed", annual: 20000, user_id: new_user.id})
    new_income.save
    expect(new_user.incomes[0][:annual]).to eq(20000)
    new_user.destroy
    new_income.destroy
  end

  it "can access child (budget)" do
    new_user = User.new({username: "test_user", pw_hash: "password", email: "testUser@email.com"})
    new_user.save
    new_budget = Budget.new({title: "Test Budget", user_id: new_user.id})
    new_budget.save
    expect(new_user.budgets[0][:title]).to eq("Test Budget")
    new_user.destroy
    new_budget.destroy
  end
end