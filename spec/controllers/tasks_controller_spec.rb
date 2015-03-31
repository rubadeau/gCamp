require 'rails_helper'
describe TasksController do

  before :each do
    @user = create_user
    session[:user_id] = @user.id
    @project = create_project
    @membership = create_membership(@user, @project)
  end

  describe "permissions" do
    scenario "only project members create tasks" do

      session.clear
      user1 = create_user(first_name: "Alley", email: "alley@gmail.com", password: "password", admin: false)
      session[:user_id] = user1.id

      get :index, project_id: @project.id
      expect(flash[:danger]).to eq "You do not have access to that project"
    end
  end
end
