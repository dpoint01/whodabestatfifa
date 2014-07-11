require 'rails_helper'


feature "user signs in", %q{
  As a User
  I want to sign in
  So that I can be identified on the website by other Users
  And also see the updated leaderboard
} do

  # Acceptance Criteria
  #
  # - I must provide my phone number and password
  # - I see an error message if I do not provide valid credentials

  scenario "user signs in with valid credentials" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Phone number', with: user.phone_number
    fill_in 'Password', with: user.password

     within("#sign_in") do
        click_on "Sign in"
      end


    expect(page).to have_content("Successfully signed in, are you da best at FIFA?")
  end

  scenario "user signs in with invalid credentials" do
    visit new_user_session_path

     within("#sign_in") do
        click_on "Sign in"
      end

    expect(page).to have_content("Invalid phone number or password.")
  end
end
