require 'rails_helper'

feature "user creates a game",%q{
  As a user
  I want to be able to create a game


  I should be signed in!
  I should be alerted if any field is filled-in in the wrong fashion
  If the game is succesfully saved,
  I should be alerted so and redirected to the
  show page.
} do

  scenario 'creates a valid game' do
    group = FactoryGirl.create(:group)
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    group.users << user1
    group.users << user2

    sign_in_as(user1)

    visit root_path
    click_on "VIEW YOUR GROUP"
    click_on "ADD GAME"

   # save_and_open_page

    select user2.username, from: "game_opponent_id"
    fill_in "game_creator_score", with: "3"
    fill_in "game_opponent_score", with: "2"

    click_on "Save Game"

    within("#history") do
     expect(page).to have_content("2")
     expect(page).to have_content(user2.username)
    end
  end

  end
