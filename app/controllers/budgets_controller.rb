require_relative "../../lib/insights.rb"

class BudgetsController < ApplicationController
  include Spending_insights

  before_action :authorize_user
  before_action :set_budget, only: %i[ show update destroy ]

  # POST /budgets
  def create
      @budget = Budget.new(budget_params.merge({user_id: @user[:id]}))
        if @budget.save
          insights = generateInsights(@budget.budget_items)
          render json: {budget: @budget, budget_items: @budget.budget_items, insights: insights}, status: :created, location: @budget
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
  end

  # PATCH/PUT /budgets/1
  def update
      new_budget = Budget.new(budget_params.merge({user_id: @user[:id]}))
      if new_budget.save
        if @budget then @budget.destroy end
        render json: {budget: new_budget, budget_items: new_budget.budget_items}, status: :created
      else
        render json: {error: "Unable to save new budget"}, status: :unprocessable_entity
      end
  end

  # DELETE /budgets/1
  def destroy
    if @budget
      @budget.destroy
      render json: {success: "Budget deleted."}, status: :ok
    else
      render json: {error: "Unauthorized."}, status: :unauthorized
    end
  end

  private
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:title, :user_id, budget_items_attributes: [:name, :value, :item_type])
    end
end
