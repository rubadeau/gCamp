describe Project do

  it "is valid with a full name email and password" do
    user=User.new(first_name:'Bruce', last_name: 'Willis', email:'bamf@diehard.com', password: 'quitelikeamouse', password_confirmation: 'quitelikeamouse' )
    expect(user).to be_valid
  end

  it "is not valid without a first_name" do
    user = User.new(first_name: nil, last_name: 'Willis', email:'bamf@diehard.com', password: 'quitelikeamouse', password_confirmation: 'quitelikeamouse')
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is not valid without a last name" do
    user = User.new(first_name: "Bruce", last_name: nil, email:'bamf@diehard.com', password: 'quitelikeamouse', password_confirmation: 'quitelikeamouse')
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is not valid without an email" do
    user = User.new(first_name: 'Bruce', last_name: 'Willis', email: nil, password: 'quitelikeamouse', password_confirmation: 'quitelikeamouse')
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
