require 'rails_helper'
describe UsersController do

  describe "GET #index" do
    it "lists all the users" do
      user = create_user
      session[:user_id] = user.id
      get :index
      expect(assigns(:users)).to eq [(user)]
    end

    it "renders :index template" do
      user = create_user
      session[:user_id] = user.id
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      user = create_user
      session[:user_id] = user.id
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      user = create_user
      session[:user_id] = user.id
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "creates new user when parameters are passed" do

      user = create_user
      session[:user_id] = user.id
      get :new

      expect {
        post :create, user: { first_name: "Barry", last_name: "Manilow", email: "smoothjazz@awesome.com", password: "password" }
      }.to change {User.all.count}.by(1)

      user = User.last

      expect(user.first_name).to eq "Barry"
      expect(user.last_name).to eq "Manilow"
      expect(user.email).to eq "smoothjazz@awesome.com"
      expect(flash[:success]).to eq "User was successfully created"
      expect(response).to redirect_to users_path
    end

    it "no new user if parameters are invalid" do

      user = create_user
      session[:user_id] = user.id
      get :new

      expect {
        post :create, user: { first_name: "Unbroken", last_name: nil, email: nil }
      }.to_not change { User.all.count }

      expect(response).to render_template :new
      expect(assigns(:user)).to be_a(User)
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = create_user
      session[:user_id] = user.id

      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      user = create_user
      session[:user_id] = user.id

      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns user to be edited" do
      user = create_user
      session[:user_id] = user.id

      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the edit template" do
      user = create_user
      session[:user_id] = user.id

      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "locates the requested user" do
      user = create_user
      session[:user_id] = user.id

      patch :update, id: user, user: {
        first_name: user.first_name, last_name: user.last_name, email: user.email
      }
      expect(assigns(:user)).to eq user
    end

    it "changes user's params" do
      user = create_user
      session[:user_id] =  user.id

      patch :update, id: user, user: { first_name: "Speed", last_name: "Racer", email: "speed@racer.com", password: "password" }
      user.reload
      expect(user.first_name).to eq("Speed")
      expect(user.last_name).to eq("Racer")
    end
  end

  describe "permissions" do

    it "raises 404 when current user trying to edit other user who is not admin" do

      @user = create_user
      user2 = create_user(first_name: "Fido", email: "fido@example.com", password: "password", admin: false)
      session[:user_id] = user2.id

      get :edit, id: @user

      expect(response).to render_template file: '404.html'
    end

  end

end
