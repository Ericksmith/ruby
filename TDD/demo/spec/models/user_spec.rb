require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not save if first_name field is blank" do
    user = User.new(
          first_name: '', 
          last_name: 'chang', 
          email: 'schang@codingdojo.com'
      )
    expect(user).to be_invalid
  end
  
  it "should not save if last_name field is blank" do
    user = User.new(
      first_name: 'test', 
      last_name: '', 
      email: 'schang@codingdojo.com'
      )
    expect(user).to be_invalid
  end
  
  # it "should not save if email already exists"
  
  # it "should not save if invalid email format"
  context "With valid attributes" do 
    it "should save" do 
      user = User.new(
        first_name: 'shane',
        last_name: 'chang',
        email: 'schang@codingdojo.com'
      )
      expect(user).to be_valid
    end
  end

  context "With invalid attributes" do 
    it "should not save if first_name field is blank" do
      user = User.new(
            first_name: '', 
            last_name: 'chang', 
            email: 'schang@codingdojo.com'
        )
      expect(user).to be_invalid
    end
    
    it "should not save if last_name field is blank" do
      user = User.new(
        first_name: 'test', 
        last_name: '', 
        email: 'schang@codingdojo.com'
        )
      expect(user).to be_invalid
    end

    it 'email should be unique' do
        user1 = User.create(first_name: 'test', last_name:'test', email: "test@test.com")
        user2 = User.create(first_name: 'test', last_name:'test', email: "test@test.com")
        expect(user2.errors.full_messages.include?("Email has already been taken")).to eq(true)
    end

    it "should contain a valid email" do
      user = User.new(
        first_name: 'test', 
        last_name: 'last', 
        email: '3213124'
        )
      expect(user).to be_invalid
      user = User.new(
        first_name: 'test', 
        last_name: 'last', 
        email: 'smith@'
        )
      expect(user).to be_invalid
    end
  end
end
