class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authenticate_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !current_user
      flash[:danger] = "You must sign in"
      redirect_to sign_in_path
    end
  end

  def project_member_or_admin_authorization
    unless (current_user.project_member_verify(@project) || current_user.admin)
      flash[:danger] = 'You do not have access to that project'
      redirect_to projects_path
    end
  end

  def project_owner_or_admin_authorization
    unless (current_user.project_owner_verify(@project) || current_user.admin)
      flash[:danger] = 'You do not have access'
      redirect_to project_path(@project)
    end
  end
end
