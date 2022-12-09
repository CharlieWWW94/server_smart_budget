class VarBudgetItemsController < ApplicationController
  before_action :set_var_budget_item, only: %i[ show update destroy ]

  # GET /var_budget_items
  def index
    @var_budget_items = VarBudgetItem.all

    render json: @var_budget_items
  end

  # GET /var_budget_items/1
  def show
    render json: @var_budget_item
  end

  # POST /var_budget_items
  def create
    @var_budget_item = VarBudgetItem.new(var_budget_item_params)

    if @var_budget_item.save
      render json: @var_budget_item, status: :created, location: @var_budget_item
    else
      render json: @var_budget_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /var_budget_items/1
  def update
    if @var_budget_item.update(var_budget_item_params)
      render json: @var_budget_item
    else
      render json: @var_budget_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /var_budget_items/1
  def destroy
    @var_budget_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_var_budget_item
      @var_budget_item = VarBudgetItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def var_budget_item_params
      params.require(:var_budget_item).permit(:name, :min, :max)
    end
end
