require 'rails_helper'

feature "user signs up", %q{
  As a User
  I want to register an account
  So that I can be identified on the website by other Users
} do

  # Acceptance Criteria

  # - I must provide my email, a password, and a password confirmation
  # - I see an error message if I do not provide all required information
  # - NOTE: The phone Number is the most important step

  scenario "user signs up with valid information" do

    visit new_user_registration_path

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test1234'
    fill_in 'Password confirmation', with: 'test1234'
    fill_in 'Phone number', with: '1234567890'
    fill_in 'Last name', with: 'Boss'
    fill_in 'Username', with: 'dpoint01'
    fill_in 'First name', with: 'David'

    click_button 'Sign up'

    expect(page).to have_content('GOALLGOAALGOALLLL! You have signed up successfully.')

  end

  scenario "user signs up without required information" do
    visit new_user_registration_path

    click_button "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Phone number can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
