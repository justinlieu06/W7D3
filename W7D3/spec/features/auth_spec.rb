require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end

    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in("username", with: "hello_world")
      fill_in("password", with: "password")
      click_button "Sign Up"
    end
end

feature "logging in" do
  given(:hello_world) { FactoryBot.create(:user_hw) }
  
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    click_button "Log In"
    
  end

end

feature "logging out" do
  given!(:hello_world) { FactoryBot.create(:user_hw) }

  scenario 'begins with a logged out state' do
    visit users_url
    expect(page).to have_content "Log In"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    login_as(hello_world)
    click_button "Log Out"
    expect(page).not_to have_content "hello_world"
  end

end