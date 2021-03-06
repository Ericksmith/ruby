require 'rails_helper'
feature "User creates an account" do
  before(:each) do 
    visit users_new_path
  end
  scenario "successfully creates a new user account" do
    fill_in "user_username", with: "Jim-bob"
    click_button "Sign In"
    expect(page).to have_content "Post a Message"
    expect(page).to have_current_path("/messages")     
  end


  scenario "doesn't fill out username field" do 
    click_button "Sign In"
    expect(page).to have_content "Username can't be blank"
  end
  
  scenario "User name too short" do
    fill_in "user_username", with: "frank"
    click_button "Sign In"
    expect(page).to have_content "Sign in Username is too short"
  end

  # scenario "unsuccessfully creates a new user account" do 
  #   click_button "Create User"
  #   expect(current_path).to eq(new_user_path)
  # end

  # scenario "doesn't fill out last name field" do 
  #   fill_in "user_first_name", with: "shane"
  #   fill_in "user_email", with: "schang@codingdojo.com"
  #   click_button "Create User"
  #   expect(page).to have_content "Last name can't be blank"
  # end

  # scenario "doesn't fill out email field" do 
  #   fill_in "user_first_name", with: "shane"
  #   fill_in "user_last_name", with: "chang"
  #   click_button "Create User"
  #   expect(page).to have_content "Email can't be blank"
  # end
end