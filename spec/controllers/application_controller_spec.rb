require 'rails_helper'
describe ApplicationController do
  describe 'current_user' do
    it 'sets current user variable' do
      user = create_user
      session[:user_id] = user.id
      expect(subject.current_user).to eq (User.find_by(id: session[:user_id]))
    end
  end
end
