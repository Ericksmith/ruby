require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "comment must be longer than 10" do 
    comment1 = Comment.create(message:"too short", user: build(:user))
    comment2 = Comment.create(message:"", user: build(:user))
    expect(comment1).to be_invalid
    expect(comment2).to be_invalid
  end

  it "Comment must belong to a user" do
    comment1 = Comment.create(message:"This is a new comment, Teeeeeeeest", post: build(:post))
    expect(comment1.errors.full_messages.include?("User can't be blank")).to eq(true)
  end

  it "comment must belong to a post" do
    comment1 = Comment.create(message:"This is a new comment, Teeeeeeeest", user: build(:user))
    expect(comment1.errors.full_messages.include?("Post can't be blank")).to eq(true)
  end
end
