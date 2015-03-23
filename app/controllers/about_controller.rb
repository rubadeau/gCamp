class AboutController < PublicController
  def index
    @projects = Project.all
    @tasks = Task.all
    @memberships = Membership.all
    @users = User.all
    @comments = Comment.all
  end

end
