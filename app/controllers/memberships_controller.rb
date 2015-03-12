class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

    def index
     @membership = @project.memberships.new
   end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    @membership = Membership.find(params[:id])
    end

  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
    flash[:success] = "#{@membership.user.full_name} was successfully created"
    redirect_to project_memberships_path
    else
      render :index
  end
 end

  def destroy
  end

  private

    def membership_params
      params.require(:membership).permit(:role, :project_id, :user_id)
    end

 end
