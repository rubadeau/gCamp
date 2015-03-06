require 'rails_helper'

describe User do

  before do
    @user = User.create!(
    first_name: 'Test',
    last_name: 'User',
    email: 'test@test.com'
    )
  end

  it "should be invalid without first name" do
    @user.update_attributes(first_name: "")
    @user.valid?
    expect(@user.errors[:first_name]).to include("can't be blank")
  end

  it "should be invalid without last name" do
    @user.update_attributes(last_name: "")
    @user.valid?
    expect(@user.errors[:last_name]).to include("can't be blank")
  end

end
