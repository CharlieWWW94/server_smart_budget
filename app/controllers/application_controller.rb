class ApplicationController < ActionController::API

    def encode_token payload
      token = JWT.encode payload, "pLeAsE_w0rk", "HS256"
      return token
    end

    def decode_token given_token
      decoded_token = JWT.decode given_token, "pLeAsE_w0rk", true, {algorithm: "HS256"}
      return decoded_token
    end

    def authorize_user
        given_token = request.headers[:Authorization].split(" ")[1]

        if given_token
          user_info = decode_token(given_token)[0]
          @user = User.find(user_info["id"])
        else
          render json: {error: "Please log in"}, status: :unauthorized
        end
    end
end
