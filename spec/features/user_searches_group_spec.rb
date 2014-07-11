require 'rails_helper'

feature 'search for chair' do

  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:group)}

  scenario 'valid search by name' do
    group

    sign_in_as(user)
    visit groups_path

    fill_in "search", with: "generic name 1"
    click_button 'Submit'
    expect(page).to have_content('generic name 1')

   end

  scenario 'valid search by location' do

    group1 = FactoryGirl.create(:group, location: 'Tokyo')

    sign_in_as(user)
    visit groups_path

    fill_in "search", with: "Tok"
    click_button 'Submit'

    expect(page).to have_content('Tokyo')
  end

  scenario 'search not found' do

    sign_in_as(user)
    visit groups_path

    fill_in "search", with: "france is the best"
    click_button 'Submit'

    expect(page).to have_content('No results')
  end

end
