class ApplicationController < ActionController::API
    def check_login
        if !session[:user_id]
          render json: {error: "Unauthorized. Please log in."}, status: :unauthorized
        else
          true
        end
    end
end
