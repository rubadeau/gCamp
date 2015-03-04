class AuthenticationController < ApplicationController

  def new
    session[:user_id] = current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] ="You have successfully signed in"
      redirect_to root_path
    else
      flash[:failure] = "Email / Password combination is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end
end
