def login(password = 'password', user = create_user)
  visit sign_in_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: password
  click_button 'Sign In'
end



def sign_in_user
  user = User.create!(
    first_name: "Test",
    last_name: "User",
    email: "test@test.com",
    password: "password",
    password_confirmation: "password")

  visit sign_in_path
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password'
  click_button 'Sign In'
end
