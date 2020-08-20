require 'rails_helper'

RSpec.feature "Events", type: :feature do


  context "create new event" do

    before(:each) do
      visit '/signup'
      within("form") do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
        fill_in 'Username', with: 'johndoe'

      end
     click_button 'Create User'
    end

    before(:each) do
      visit new_event_path
      within("form") do
        fill_in 'Title', with: 'test title'
        fill_in 'Description', with: 'test body'
        fill_in 'Event date', with: '25-10-2020'
      end
    end

    scenario "should be successful" do
      within("form") do
        fill_in 'Location', with: 'Kenya'
      end
      click_button 'Create Event'
      expect(page).to have_content 'Event Created Successfully'
    end

    scenario "should fail" do
      click_button 'Create Event'
      expect(page).to have_content 'Location can\'t be blank'
    end
  end
end
