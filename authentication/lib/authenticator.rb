module Authentication
require 'bcrypt'
BCrypt::Engine.cost = 8
secret = "password"
password = BCrypt::Password.create(secret, :cost => 10)

puts password 
end