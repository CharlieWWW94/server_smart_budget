require 'rails_helper'

RSpec.describe BudgetItem, type: :model do
  it "is valid when given valid attributes" do
    new_user = User.new({username: "test_user", pw_hash: "password", email: "testUser@email.com"})
    new_user.save
    test_budget = Budget.new({user_id: new_user.id})
    test_budget.save
    test_item = BudgetItem.new({item_type: "Fixed", value: 200, name: "Rent", budget_id: test_budget.id})
    expect(test_item).to be_valid
    new_user.destroy
    test_budget.destroy
    test_item.destroy
  end
end
