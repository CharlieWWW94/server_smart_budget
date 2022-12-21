require "rails_helper"
require "factory_bot_rails"

Rspec.describe "Login", type: :request do
    describe "login user (POST /login)" do
        let! (:test_user) {FactoryBot.build(:user)}

        context "With valid parameters" do
                  
            before do
                post "/users", params: {
                    username: new_reg.username,
                    email: new_reg.email,
                    pw_hash: new_reg.pw_hash,
                    city: new_reg.city,
                    county: new_reg.county,
                    country: new_reg.country,
                }
            end

    end
    end
end