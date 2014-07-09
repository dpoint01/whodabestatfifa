require 'rails_helper'

feature "user creates a group",%q{
  As a user
  I want to be able to create a group
  so that me and my friends can join it

  Acceptance Criteria

  I should be signed in!
  I should be alerted if any field is filled-in in the wrong fashion
  If the group is succesfully saved,
  I should be alerted so and redirected to the newly created group
  show page.
} do


  let(:user) { FactoryGirl.create(:user) }

  scenario 'creates a valid group' do
    sign_in_as(user)

    visit new_group_path

    fill_in "Name", with: "Lovell House"
    fill_in "Location", with: "Boston"
    fill_in "Description", with: "This is a very intense group"

    click_on "Start the Banter"

    expect(page).to have_content("Lovell House")
  end

  scenario 'add two groups with same name' do
    #create a name to add in database so that next one will conflict
    group = FactoryGirl.create(:group, name: "same", location: "whatever")

    sign_in_as(user)
    visit new_group_path

    #name "Same" already exists
    fill_in "Name", with: group.name
    fill_in "Location", with: "Boston"
    fill_in "Description", with: "This is the best group out there"

    click_on "Start the Banter"

    expect(page). to have_content("already been taken")
  end

  scenario 'user did not fill in required fields' do
    sign_in_as(user)

    visit new_group_path

    fill_in "Description", with: "This group is by far the best"
    #fill_in "Location", with: "This group is by far the best"

    click_on "Start the Banter"

    expect(page). to have_content("can't be blank")
  end

  scenario 'user is not signed in and wants to access page' do
    visit 'groups/new'
    expect(page). to have_content("You need to sign in")
  end

end
