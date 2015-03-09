class RegistrationsController < ApplicationController

  def new
    @user= User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :password_confirmation)
  end
end
