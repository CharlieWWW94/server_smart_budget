require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    new_user = User.new({username: "test_user", pw_hash: "password", email: "testUser@email.com"})
    expect(new_user).to be_valid  
  end
  it "is not valid without username" do
  missing_username = User.new({username: nil, pw_hash: "password"})
  expect(missing_username).to_not be_valid
  end
  it "is not valid without pw_hash" do
  missing_pw = User.new({username: "missing_pw"})
  expect(missing_pw).to_not be_valid
  end

  it "can access child (income)" do
  end

  it "can access child (budget)" do
  end
end