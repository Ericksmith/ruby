require 'rails_helper'

RSpec.describe User, type: :model do
  context "Valid User input" do
    it "should create a new user" do
      user1 = User.new(username:"Thisshouldwork")
      expect(user1).to be_valid
    end
  end

  context "Invalid user inputs:" do
    it "usernames shorter than 6 length shouold be invalid" do
      user1 = User.new(username:"test")
      expect(user1).to be_invalid
    end

    it "username must be unique" do
      user1 = User.create(username:"testtest")
      user2 = User.create(username: "testtest")
      expect(user2).to be_invalid
    end
  end
end
