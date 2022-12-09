require "test_helper"

class VarBudgetItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @var_budget_item = var_budget_items(:one)
  end

  test "should get index" do
    get var_budget_items_url, as: :json
    assert_response :success
  end

  test "should create var_budget_item" do
    assert_difference("VarBudgetItem.count") do
      post var_budget_items_url, params: { var_budget_item: { max: @var_budget_item.max, min: @var_budget_item.min, name: @var_budget_item.name } }, as: :json
    end

    assert_response :created
  end

  test "should show var_budget_item" do
    get var_budget_item_url(@var_budget_item), as: :json
    assert_response :success
  end

  test "should update var_budget_item" do
    patch var_budget_item_url(@var_budget_item), params: { var_budget_item: { max: @var_budget_item.max, min: @var_budget_item.min, name: @var_budget_item.name } }, as: :json
    assert_response :success
  end

  test "should destroy var_budget_item" do
    assert_difference("VarBudgetItem.count", -1) do
      delete var_budget_item_url(@var_budget_item), as: :json
    end

    assert_response :no_content
  end
end
