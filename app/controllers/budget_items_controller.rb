class BudgetItemsController < ApplicationController
  before_action :check_login
  before_action :set_budget_item, only: %i[ show update destroy ]

  # GET /budget_items
  # def index
  #   @budget_items = BudgetItem.all

  #   render json: @budget_items
  # end

  # GET /budget_items/1
  # def show
  #   render json: @budget_item
  # end

  # POST /budget_items
  def create
    @budget_item = BudgetItem.new(budget_item_params)
    puts @budget

    if @budget_item.save
      render json: @budget_item, status: :created
    else
      render json: @budget_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /budget_items/1
  def update
    current_user = User.includes(:budgets).find(session[:user_id])
    
    if current_user.budgets.any?{|budget| budget.id == @budget_item.budget_id}
      @budget_item.update(budget_item_params)
      render json: @budget_item, status: :ok
    else
      render json: @budget_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budget_items/1
  def destroy
    current_user = User.includes(:budgets).find(session[:user_id])

    if current_user.budgets.any?{|budget| budget.id == @budget_item.budget_id}
      @budget_item.destroy
      render json: {success: "budget_item destroyed"}, status: :ok
    else
      render json: {error: "That resource does not belong to you."}, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_item
      @budget_item = BudgetItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_item_params
      params.permit(:name, :value, :item_type, :budget_id)
    end
end
