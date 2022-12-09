require "test_helper"

class IncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @income = incomes(:one)
  end

  test "should get index" do
    get incomes_url, as: :json
    assert_response :success
  end

  test "should create income" do
    assert_difference("Income.count") do
      post incomes_url, params: { income: { annual: @income.annual, month: @income.month, type: @income.type, week: @income.week } }, as: :json
    end

    assert_response :created
  end

  test "should show income" do
    get income_url(@income), as: :json
    assert_response :success
  end

  test "should update income" do
    patch income_url(@income), params: { income: { annual: @income.annual, month: @income.month, type: @income.type, week: @income.week } }, as: :json
    assert_response :success
  end

  test "should destroy income" do
    assert_difference("Income.count", -1) do
      delete income_url(@income), as: :json
    end

    assert_response :no_content
  end
end
