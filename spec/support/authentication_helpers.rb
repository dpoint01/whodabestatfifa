module Helpers
  module Authentication
    def sign_in_as(user)
      visit new_user_session_path
      fill_in "Phone number", with: user.phone_number
      fill_in "Password", with: user.password
      within("#sign_in") do
        click_on "Sign in"
      end
    end
  end
end
