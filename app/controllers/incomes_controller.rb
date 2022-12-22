class IncomesController < ApplicationController
  before_action :authorize_user
  before_action :set_income, only: %i[ show update destroy ]

  # POST /incomes
  def create
    # Remove any pre-existing incomes from db
    Income.where(user_id: @user.id).each {|income| income.destroy}
    # These store new objects and errors created in following loop
    created_incomes = []
    income_errors = []
    # Iterate over new incomes and creates each in DB
    params[:new_incomes].each do |income|
      begin
        new_income = Income.new(
          {income_type: income["income_type"], 
            month: income["month"], 
            annual: income["annual"], 
            user_id: @user[:id]}
          )
        new_income.save
        created_incomes.push(new_income)
      rescue
        income_errors.push(new_income_entry.errors)
      end
    end
        render json: {incomes: created_incomes, income_errors: income_errors}, 
        status: :created
  end

  # DELETE /incomes/1
  def destroy
      if @income.user_id == session[:user_id]
        @income.destroy
        render json: {success: "Income deleted"}, status: :ok
      else
        render json: {error: "Permission denied"}, status: :unauthorized
      end
  end

  private

    def set_income
      @income = Income.find(params[:id].to_i)
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.permit(:income, :income_type, :annual, :month, :week, :user_id)
    end
end
