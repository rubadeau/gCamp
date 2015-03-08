def create_user(overrides = {})
  User.create!(
    first_name: 'Bruce',
    last_name: 'Willis',
    email: 'bamf@diehard.com',
    password: 'quitelikeamouse',
    password_confirmation: 'quitelikeamouse'
    ).merge(overrides))
end
