require "rails_helper"
require "factory_bot_rails"


# FactoryBot.find_definitions


RSpec.describe 'Register', type: :request do
    describe 'POST to /users' do
        let!(:new_reg) {FactoryBot.build(:user)}
        
        context 'with valid parameters' do
            
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

            it "returns a token" do
                expect(json["token"]).to be_an_instance_of(String)
            end
            
        end
    end
end