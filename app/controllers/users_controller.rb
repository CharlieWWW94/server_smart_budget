class UsersController < ApplicationController
  before_action :authorize_user, only: %i[ show update destroy ]

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
    if @user.pw_hash == params[:pw_hash]
      user_token = encode_token({id: @user.id, username: @user.username})
      user_budget = Budget.includes(:budget_items).find_by(user_id: @user.id);
      puts "LOGIN SUCCESSFUL"
      render json: {token: user_token, user: @user, budget: user_budget, budget_items: user_budget.budget_items}, status: :ok
    else
      render json: {error: "Login information incorrect."}, status: :unauthorized
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

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
