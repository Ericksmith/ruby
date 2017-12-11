require 'rails_helper'
feature "User creates comment/post" do
  before(:each) do 
    visit users_new_path
  end
  scenario "successfully create a new post" do
    fill_in "user_username", with: "Jim-bob"
    click_button "Sign In"
    expect(page).to have_content "Post a Message"
    fill_in "post_content", with: "09jsvj2039jdoiansoij20hnfoaihsohj210jh"
    click_button "Post a Message"
    expect(page).to have_content "09jsvj2039jdoiansoij20hnfoaihsohj210jh"
    expect(page).to have_current_path(messages_path)
  end

  scenario "successfully create new comment" do
    fill_in "user_username", with: "Jim-bob"
    click_button "Sign In"
    expect(page).to have_content "Post a Message"
    fill_in "post_content", with: "09jsvj2039jdoiansoij20hnfoaihsohj210jh"
    click_button "Post a Message"
    fill_in "comment_content", with: "OIND23OSFNS234243DFNAfsdfasf"
    click_button "Post a Comment"
    expect(page).to have_content "OIND23OSFNS234243DFNAfsdfasf"
    expect(page).to have_current_path(messages_path)
  end
end