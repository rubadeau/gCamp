class MembershipsController < ApplicationController

  before_action :authenticate_user
  before_action :set_project
  before_action :set_membership, only: [:update, :destroy]
  before_action :project_member_or_admin_authorization
  before_action :project_owner_or_admin_authorization, except: [:index]
  before_action :project_must_have_at_least_one_owner, only: [:update, :destroy]


  def index
     @membership = @project.memberships.new
   end

  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
    flash[:success] = "#{@membership.user.full_name} was successfully added"
    redirect_to project_memberships_path
    else
      render :index
    end
  end

  def update
    if @membership.update(membership_params)
      flash[:success] = "#{@membership.user.full_name} was successfully updated"
      redirect_to project_memberships_path
    else
      render :index
    end
  end

  def destroy
    @membership.destroy
    flash[:success] = "#{@membership.user.full_name} was removed from project"
    redirect_to project_memberships_path
  end

  private

    def membership_params
      params.require(:membership).permit(:role, :project_id, :user_id)
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_membership
      @membership = Membership.find(params[:id])
    end

    def project_must_have_at_least_one_owner
      if @membership.role == 'Owner' && @project.memberships.where(role: 'Owner').count <= 1
        flash[:danger] = "Projects must have at least one owner"
        redirect_to project_memberships_path(@project)
      end
    end

 end
