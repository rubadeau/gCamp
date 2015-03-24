require 'rails_helper'

  feature 'Sign Out' do

    before :each do
      User.destroy_all
    end

    scenario 'Users can sign out' do

      sign_in_user

      expect(page).to have_content("Test User")

      click_on 'Sign Out'

      expect(page).to have_content 'Sign In'
      expect(page).to have_content("You have successfully logged out")
    end
end
