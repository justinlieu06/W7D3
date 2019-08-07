module AuthFeaturesHelper
  def login_as(user)
    visit new_session_url
    fill_in "username", with: user.username
    fill_in "password", with: "password"
    click_button "Log In"
  end
end