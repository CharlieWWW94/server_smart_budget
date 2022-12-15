module AuthenticationMod
require 'bcrypt'

def create_hash(password)
    BCrypt::Engine.cost = 8
    pw_hash = BCrypt::Password.create(password, :cost => 10)
    return pw_hash
end

def check_hash(hashed_password, given_password)
    unhashed_password = BCrypt::Password.new(hashed_password)
    return unhashed_password == given_password
end
end

