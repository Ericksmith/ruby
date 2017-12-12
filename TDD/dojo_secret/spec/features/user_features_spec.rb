require 'rails_helper'
feature 'User features ' do
  before(:each) do
    @user = build(:user)
  end
  feature "user sign-up" do
    scenario 'visits sign-up page' do
      visit new_user_path
      expect(page).to have_content "Register"
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
      expect(page).to have_content "Name"
      expect(page).to have_content "Confirm Password"
    end
    scenario "with improper inputs, redirects back to sign in and shows validations" do
      visit new_user_path
      click_button 'Register'
      expect(current_path).to eq(new_user_path)
      expect(page).to have_text("can't be blank")
    end
    scenario "with proper inputs, create user and redirects to login page" do
      register
      expect(page).to have_text("Welcome #{@user.name}")
    end
  end
  feature "user dashboard" do 
    scenario "displays user information" do
      register
      expect(page).to have_text(@user.name)
    end
  end
end
