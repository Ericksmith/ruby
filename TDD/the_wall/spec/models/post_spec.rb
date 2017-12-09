require 'rails_helper'

RSpec.describe Post, type: :model do
  it "Post must be longer than 10" do 
    post1 = Post.create(content:"too short", user: build(:user))
    post2 = Post.create(content:"", user: build(:user))
    expect(post1).to be_invalid
    expect(post2).to be_invalid
  end

  it "Post must belong to a user" do
    post1 = Post.create(content:"This is a new post, Teeeeeeeest")
    expect(post1.errors.full_messages.include?("User can't be blank")).to eq(true)
  end
end
