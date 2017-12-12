require 'rails_helper'
feature 'authentication feature' do
  before(:each) do
    @user = create(:user)
  end
  feature "user attempts to sign-in" do
    scenario 'visits sign-in page, prompted with email and password fields' do
      visit new_session_path
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
      expect(page).to have_content "Log In"
    end
    scenario 'logs in user if email/password combination is valid' do
      log_in
      expect(current_path).to eq(user_path(@user.id))
      expect(page).to have_text(@user.name)
    end
    scenario 'does not sign in user if email is not found' do
      log_in email: "eadg5e4aer@gmail.com"
      expect(current_path).to eq(new_session_path)
      expect(page).to have_text("Email or password not found.")
    end
    scenario 'does not sign in user if email/password combination is invalid' do
      log_in password: "wrongpassword"
      expect(current_path).to eq(new_session_path)
      expect(page).to have_text("Email or password not found.")
    end
  end
  feature "user attempts to log out" do
    scenario 'displays "Log Out" button when user is logged on' do
      log_in
      expect(current_path).to eq(user_path(@user.id))
      expect(page).to have_text("Log Out")
    end
    scenario 'logs out user and redirects to login page' do
      log_in
      expect(current_path).to eq(user_path(@user.id))
      click_button "Log Out"
      expect(current_path).to eq(new_session_path)
    end
  end
end