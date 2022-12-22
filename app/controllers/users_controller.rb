require_relative "../../authentication/lib/authenticator.rb"
require_relative "../../lib/insights.rb"


class UsersController < ApplicationController
  before_action :authorize_user, only: %i[ show update destroy ]
  include AuthenticationMod
  include Spending_insights

  #POST /users/login
  def login
    set_user_for_login

    if !@user || !check_hash(@user[:pw_hash], user_params[:pw_hash])
      render json: {error: "Login information incorrect."}, status: :unauthorized
    else
      user_token = encode_token()
      user_budget = Budget.includes(:budget_items).find_by(user_id: @user.id);
      insights = generateInsights(user_budget.budget_items)
      if user_budget
        render json: {
          token: user_token, 
          user: @user, 
          budget: user_budget, 
          budget_items: user_budget.budget_items, 
          incomes: @user.incomes,
          insights: insights
          }, status: :ok
      else
        render json: {
          token: user_token, 
          user: @user, 
          incomes: @user.incomes}, status: :ok
      end
    end
  end

  # POST /users
  def create
    if user_params[:email] != email_check(user_params[:email])
      render json: {error: "Please provide a valid email"}, status: :bad_request
    else
      @user = User.new(user_params)
      @user.pw_hash = create_hash(@user.pw_hash)
        if @user.save
          user_token = encode_token()
          render json: {token: user_token, user: @user}, status: :created, location: @user
        else
          render json: {error: "Username already taken."}, status: :bad_request
        end
    end
  end

  # DELETE /users/1
  def destroy
      if @user.destroy
      render json: {success: "User account deleted"}, status: :ok
      else
      render json: {error: "That action is not permitted."}, status: :unauthorized
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_for_login
      @user = User.find_by(username: params[:username])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:id, :username, :email, :mobile, :pw_hash, :city, :county, :country)
    end

    # Moses' email_check function
    def email_check input
      if input.length == 0
          return "Please provide a valid email"
      elsif input.exclude? "@"
          return "Please provide a valid email"
      else 
          return input
      end
    end
end
