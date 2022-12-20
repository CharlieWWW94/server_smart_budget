class BudgetsController < ApplicationController
  before_action :authorize_user
  before_action :set_budget, only: %i[ show update destroy ]

  # GET /budgets
  def index
    @budgets = Budget.all
    render json: @budgets
  end

  # GET /budgets/1
  def show
    render json: {budget: @budget, budget_items_attributes: @budget.budget_items}
  end

  # POST /budgets
  def create
      @budget = Budget.new(budget_params.merge({user_id: @user[:id]}))
        if @budget.save
          budget_items = BudgetItem.all
          puts budget_items
          #YOUR CALCULATION FUNCTION GOES HERE. TAKE: budget_items, @budget.budget_items
          render json: {budget: @budget, budget_items: @budget.budget_items}, status: :created, location: @budget
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
  end

  # PATCH/PUT /budgets/1
  def update
    # if @budget.update(budget_params)
    #   render json: {budget: @budget, budget_items_attributes: @budget.budget_items}
    # else
    #   render json: @budget.errors, status: :unprocessable_entity
    # end
      new_budget = Budget.new(budget_params.merge({user_id: @user[:id]}))

      if new_budget.save
        if @budget then @budget.destroy end
          puts "we did it!"
        render json: {budget: new_budget, budget_items: new_budget.budget_items}, status: :created
      else
        render json: {error: "Unable to save new budget"}, status: :unprocessable_entity
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

    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:title, :user_id, budget_items_attributes: [:name, :value, :item_type])
    end
end
