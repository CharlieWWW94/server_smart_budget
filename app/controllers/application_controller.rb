class ApplicationController < ActionController::API

    def encode_token payload
      token = JWT.encode payload, "pLeAsE_w0rk", "HS256"
      return token
    end

    def decode_token given_token
      decoded_token = JWT.decode given_token, "pLeAsE_w0rk", true, {algorithm: "HS256"}
      return decoded_token
    end
end
