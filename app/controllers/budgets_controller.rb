class BudgetsController < ApplicationController
  before_action :check_login
  before_action :set_budget, only: %i[ show update destroy ]

  # GET /budgets
  def index
    @budgets = Budget.all
    render json: @budgets
  end

  # GET /budgets/1
  def show
    render json: @budget
  end

  # POST /budgets
  def create
      @budget = Budget.new(budget_params.merge({user_id: session[:user_id]}))
        if @budget.save
          render json: {budget: @budget, budget_items: @budget.budget_items, var_budget_items: @budget.var_budget_items}, status: :created, location: @budget
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
  end

  # PATCH/PUT /budgets/1
  def update
    if @budget.update(budget_params)
      render json: @budget
    else
      render json: @budget.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budgets/1
  def destroy
    if @budget.user_id == session[:user_id]
      @budget.destroy
      render json: {success: "Budget deleted."}, status: :ok
    else
      render json: {error: "Unauthorized."}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_login
      if !session[:user_id]
        render json: {error: "Unauthorized. Please log in."}, status: :unauthorized
      else
        true
      end
    end

    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:title, :user_id, budget_items_attributes: [:name, :value], var_budget_items_attributes: [:name, :max, :min])
    end
end
