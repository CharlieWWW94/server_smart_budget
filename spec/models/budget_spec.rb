require 'rails_helper'

RSpec.describe Budget, type: :model do
  it "is valid with title attribute" do
    budget_user = User.new({username: "Budget test user", pw_hash: "123"})
    budget_user.save
    test_budget = Budget.new({title: "Test Budget", user_id: budget_user.id})
    expect(test_budget).to be_valid
    budget_user.destroy
  end

  it "is invalid without user_id attribute" do
    test_budget = Budget.new({title: "Test Budget"})
    expect(test_budget).to_not be_valid
  end

  it "is valid without title attribute" do
    budget_user = User.new({username: "Budget test user", pw_hash: "123"})
    budget_user.save
    test_budget = Budget.new({user_id: budget_user.id})
    expect(test_budget).to be_valid
    budget_user.destroy
  end

  it "can access and save nested children (budget_items)" do
    budget_user = User.new({username: "Budget test user", pw_hash: "123"})
    budget_user.save
    test_budget = Budget.new({user_id: budget_user.id, budget_items_attributes:[{name: "Rent", value: 200, item_type:"Fixed"}, {name: "Bills", value: 100, item_type:"Fixed"}]})
    expect(test_budget.budget_items.length).to equal(2)
    budget_user.destroy
  end
end
