class ApplicationController < ActionController::API
    # Creates a token based on user_id, username and a secret key
    def encode_token
      token = JWT.encode({id: @user.id, username: @user.username} , "pLeAsE_w0rk", "HS256")
      return token
    end

    # Decrypts token for user verification
    def decode_token given_token
      decoded_token = JWT.decode given_token, "pLeAsE_w0rk", true, {algorithm: "HS256"}
      return decoded_token
    end

    # Breaks down authorization header to confirm user
    def authorize_user
        header = request.headers[:Authorization]

        if header
          given_token = header.split(" ")[1]
          user_info = decode_token(given_token)[0]
          @user = User.find(user_info["id"])
        else
          render json: {error: "Please log in"}, status: :unauthorized
        end
    end
end
