require "rails_helper"
require "factory_bot_rails"

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

        context 'with invalid email' do

            before do
                post "/users", params: {
                    username: new_reg.username,
                    email: "this is not an email",
                    pw_hash: new_reg.pw_hash,
                    city: new_reg.city,
                    county: new_reg.county,
                    country: new_reg.country,
                }
            end

            it "returns status 400 bad request" do
                expect(response.status).to eq(400)
            end

            it "returns an error message" do
                expect(json["error"]).to eq("Please provide a valid email")
            end
        end

        context "duplicate username" do
            before do
                post "/users", params: {
                    username: "duplicate",
                    email: new_reg.email,
                    pw_hash: new_reg.pw_hash,
                    city: new_reg.city,
                    county: new_reg.county,
                    country: new_reg.country,
                }

                post "/users", params: {
                    username: "duplicate",
                    email: new_reg.email,
                    pw_hash: new_reg.pw_hash,
                    city: new_reg.city,
                    county: new_reg.county,
                    country: new_reg.country,
                }
            end

            it "returns error with duplicate username" do
                expect(json["error"]).to eq("Username already taken.")
            end

            it "returns status status 400 bad request" do
                expect(response.status).to eq(400)
            end
        end
    end
end