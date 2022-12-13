class IncomesController < ApplicationController
  before_action :check_login
  before_action :set_income, only: %i[ show update destroy ]

  # GET /incomes
  def index
    @incomes = Income.all

    render json: @incomes
  end

  # GET /incomes/1
  def show
    render json: @income
  end

  # POST /incomes
  def create
    puts request.body

    if !session[:user_id]
      render json: {error: "Please login before adding income"}, status: :unauthorized
    else
      new_income = Income.new(income_params.merge({user_id: session[:user_id]}))
      @income = calculate_income(new_income)
      if @income.save
        render json: @income, status: :created, location: @income
      else
        render json: @income.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /incomes/1
  def update
    if @income.update(income_params)
      render json: @income
    else
      render json: @income.errors, status: :unprocessable_entity
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def check_login
      if !session[:user_id]
        render json: {error: "Unauthorized. Please log in."}, status: :unauthorized
      else
        true
      end
    end

    def set_income
      @income = Income.find(params[:id].to_i)
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.permit(:income_type, :annual, :month, :week, :user_id)
    end

    def calculate_income given_income
      if given_income.annual
        given_income.month = (given_income.annual / 12).round(2)
        given_income.week = (given_income.month / 4).round(2)
      else
        given_income.annual = (given_income.month * 12).round(2)
        given_income.week = (given_income.month / 4).round(2)
      end
      return given_income
    end
end
