class AuthenticationController < PublicController

  def new
    session[:user_id] = current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] ="You have successfully signed in"
        if session[:request_path]
          redirect_to session[:request_path]
          session[:request_path] = nil
        else
          redirect_to projects_path
        end
    else
      @sign_in_error = "Email / Password combination is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
end
