require 'rails_helper'

RSpec.describe User, type: :model do
  context "Valid inputs:" do
    it "should create a new user" do
      expect(build(:user)).to be_valid
    end

    it "password should be changed to password_digest" do
      expect(build(:user).password_digest.present?).to eq(true)
    end

    it "email should save to database in lowercase" do
      expect(create(:user, email:"CAPTCAPLOCK@LOUD.COM").email).to eq("captcaplock@loud.com")
    end
  end

  context "Missing inputs:" do
    it "Should not save user model without a name" do
      expect(build(:user, name: nil)).to be_invalid
    end

    it "Should not save user model without email" do
      expect(build(:user, email: nil)).to be_invalid
    end

    it "should not save user model without password" do
      expect(build(:user, password: nil)).to be_invalid
    end
  end

  it "user email should be unique" do
    create(:user)
    expect(build(:user)).to be_invalid
  end

  it "User email should be valid format" do
    bad_emails = ["adsoinfoiasdnf", "", "@user", "@test.com"]
    bad_emails.each do |email|
      expect(build(:user, email: email)).to be_invalid
    end
  end

  it "password doesn't match password_confirmation" do
    expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
  end
end