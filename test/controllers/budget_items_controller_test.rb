require "test_helper"

class BudgetItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget_item = budget_items(:one)
  end

  test "should get index" do
    get budget_items_url, as: :json
    assert_response :success
  end

  test "should create budget_item" do
    assert_difference("BudgetItem.count") do
      post budget_items_url, params: { budget_item: { name: @budget_item.name, value: @budget_item.value } }, as: :json
    end

    assert_response :created
  end

  test "should show budget_item" do
    get budget_item_url(@budget_item), as: :json
    assert_response :success
  end

  test "should update budget_item" do
    patch budget_item_url(@budget_item), params: { budget_item: { name: @budget_item.name, value: @budget_item.value } }, as: :json
    assert_response :success
  end

  test "should destroy budget_item" do
    assert_difference("BudgetItem.count", -1) do
      delete budget_item_url(@budget_item), as: :json
    end

    assert_response :no_content
  end
end
