require_relative "../../authentication/lib/authenticator.rb"

class UsersController < ApplicationController
  before_action :authorize_user, only: %i[ show update destroy ]
  include AuthenticationMod

  # GET /users
  # NEVER needed.
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  # GET /users/1
  # def show
  #   render json: @user
  # end

  #POST /users/login
  def login
    set_user_for_login
    if @user && check_hash(@user[:pw_hash], user_params[:pw_hash])
      user_token = encode_token({id: @user.id, username: @user.username})
      user_budget = Budget.includes(:budget_items).find_by(user_id: @user.id);

      if user_budget
        render json: {token: user_token, user: @user, budget: user_budget, budget_items: user_budget.budget_items}, status: :ok
      else
        render json: {token: user_token, user: @user}, status: :ok
      end
    else
      render json: {error: "Login information incorrect."}, status: :unauthorized
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.pw_hash = create_hash(@user.pw_hash)
    if @user.save
      user_token = encode_token({id: @user.id, username: @user.username})
      render json: {token: user_token, user: @user}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     render json: @user
  #   else
  #     render json: @user.errors, status: :unprocessable_entity
  #   end
  # end

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
end
