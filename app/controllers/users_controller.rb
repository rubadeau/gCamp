class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully created"
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User was successfully updated"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "User was successfully deleted"
      redirect_to users_path
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
