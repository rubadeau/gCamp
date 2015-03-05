require 'rails_helper'

  feature 'Sign In' do

    scenario 'Users can sign in' do
      visit root_path
      click_on 'Sign In'
      expect(page).to have_content("Sign into gCamp")

      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'

      within("form") {click_on 'Sign In'}
      expect(page).to have_content("You have successfully signed in")
      expect(page).to have_content("Test User")
      expect(current_path).to eq '/'
    end
  end
