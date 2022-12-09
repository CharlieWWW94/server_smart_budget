class BudgetItemsController < ApplicationController
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

    if @budget_item.save
      render json: @budget_item, status: :created, location: @budget_item
    else
      render json: @budget_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /budget_items/1
  def update
    if @budget_item.update(budget_item_params)
      render json: @budget_item
    else
      render json: @budget_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /budget_items/1
  def destroy
    @budget_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget_item
      @budget_item = BudgetItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_item_params
      params.require(:budget_item).permit(:name, :value)
    end
end
