require 'rails_helper'

  feature 'Sign In' do

    before :each do
      User.destroy_all
    end

    scenario 'Users can sign in' do

      user = User.create!(
      first_name: 'Bruce',
      last_name: 'Willis',
      email: 'bamf@diehard.com',
      password: 'quitelikeamouse',
      password_confirmation: 'quitelikeamouse')

      visit root_path
      expect(page).to have_content 'Your life, organized'

      click_link 'Sign In'
      expect(current_path).to eq '/sign-in'
      expect(page).to have_content 'Sign into gCamp'
      click_button 'Sign In'
      expect(page).to have_content 'Email / Password combination is invalid'

      fill_in 'Email', with: 'bamf@diehard.com'
      fill_in "Password", with: 'quitelikeamouse'
      click_button 'Sign In'

      expect(current_path).to eq root_path
      expect(page).to have_content 'Your life, organized'
      expect(page).to have_content 'You have successfully signed in'
    end

    scenario 'User redirected if error' do
      visit root_path
      click_link 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Sign into gCamp'

      fill_in 'Email', with: 'fail@diehard.com'
      fill_in 'Password', with: 'notquitelikeamouse'
      click_button 'Sign In'

      expect(current_path).to eq(sign_in_path)
      expect(page).to have_content 'Email / Password combination is invalid'
    end
end
