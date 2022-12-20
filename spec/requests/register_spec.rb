require "rails_helper"

Rspec.describe 'Register', type: :request do
    describe 'POST to /users' do
        context 'with valid parameters' do
            before(:all) do
                post "/users", params: {
                    
                }
            end
        end
    end
end