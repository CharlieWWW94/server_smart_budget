class IncomesController < ApplicationController
  before_action :authorize_user
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
    income_list = params[:new_incomes]
    puts "HELLO"
    puts income_list
    created_incomes = []

    income_list.each do |income|
      begin
        new_income = {income_type: income["income_type"], month: income["month"]}
        new_income_entry = Income.new(new_income.merge({user_id: @user[:id]}))
        new_income_entry_complete = calculate_income(new_income_entry)
        new_income_entry_complete.save
        created_incomes.push(new_income_entry_complete)
        puts created_incomes
      rescue
        render json: new_income_entry.errors, status: :unprocessable_entity
        break
      end
    end
      #ADD TAX CALCULATIONS HERE
      if income_list.length == created_incomes.length
        render json: {incomes: created_incomes}, status: :created, location: @income
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

    def set_income
      @income = Income.find(params[:id].to_i)
    end

    # Only allow a list of trusted parameters through.
    def income_params
      params.permit(:income, :income_type, :annual, :month, :week, :user_id)
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
