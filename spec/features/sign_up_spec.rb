require 'rails_helper'

feature 'Sign Up' do

  scenario 'user can sign up' do
    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content("Sign up for gCamp!")

    fill_in :user_first_name, with: 'Test'
    fill_in :user_last_name, with: 'User'
    fill_in :user_email, with: 'test@test.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'

    within("form") {click_on 'Sign Up'}

    expect(current_path).to eq '/'
    expect(page).to have_content("You have successfully signed up")
    expect(page).to have_content('Test User')
    expect(page).to have_no_content( 'Sign Up')
  end

end
