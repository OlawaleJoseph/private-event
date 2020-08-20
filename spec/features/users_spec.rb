require 'rails_helper'

RSpec.feature "Users", type: :feature do
  context "create new user" do
    before(:each) do
      visit '/signup'
      within("form") do
        fill_in 'First name', with: 'john'
        fill_in 'Last name', with: 'doe'
      end
    end

    scenario "should be successful" do
      within("form") do
        fill_in 'Username', with: 'john.doe@example.com'
      end
      click_button 'Create User'
      expect(page).to have_content 'User successfully created.'
    end

    scenario "should fail" do
      click_button 'Create User'
      expect(page).to have_content 'Username can\'t be blank'
    end

  end

  context "update user" do
    scenario "should be successful" do
      user = User.create(first_name: 'John', last_name: 'Doe', username: 'john.doe@example.com')
      visit edit_user_path(user)
      within("form") do
        fill_in 'First name', with: 'Jane'
        fill_in 'Last name', with: 'Does'
      end
      click_button 'Update User'
      expect(page).to have_content 'User was successfully updated.'
    end

    scenario "should fail" do
      user = User.create(first_name: 'John', last_name: 'Doe', username: 'john.doe@example.com')
      visit edit_user_path(user)
      within("form") do
        fill_in 'First name', with: ''
      end
        click_button 'Update User'
      expect(page).to have_content 'First name can\'t be blank'
    end

  end
end
