require "rails_helper"
describe ProjectsController do

  before :each do
    @user = create_user
    session[:user_id] = @user.id
    @project = create_project
    membership = create_membership(@user, @project)
  end

  describe "permissions" do
    it "asigns self as owner of new project" do

      get :new

      expect {
        post :create, project: { name: "High Five" }
      }.to change {Project.all.count}.by(1)

      expect(Membership.last.role).to eq "Owner"

    end

    it "redirects users to tasks index after project creation" do

      get :new

      expect {
        post :create, project: { name: "Test Project" }
      }.to change {Project.all.count}.by(1)

      expect(response).to redirect_to project_tasks_path(Project.last)

    end

  end

  describe "GET #index" do
    it "lists all projects" do

      get :index

      expect(assigns(:project)).to eq Project.all
    end

    it "renders the :index template" do

      get :index

      expect(response).to render_template :index
    end

  end

  describe "GET #show" do
    it "assigns the requested project" do

      get :show, id: @project
      expect(assigns(:project)).to eq @project

    end

    it "renders the :show template" do

      get :show, id: @project
      expect(response).to render_template :show
    end
  end

  describe "permissions" do
    it "redirects visitors to sign in path" do
      session.clear
      get :show, id: @project
      expect(flash[:danger]).to eq "You must sign in"
      expect(response).to redirect_to sign_in_path
    end

    it "redirects non-members or admin to projects path" do
      session.clear
      @user1 = create_user(first_name: "Alley", email: "alley@gmail.com", password: "password", admin: false)
      session[:user_id] = @user1.id
      get :show, id: @project
      expect(flash[:danger]).to eq "You do not have access to that project"
      expect(response).to redirect_to projects_path
    end


  end

end
