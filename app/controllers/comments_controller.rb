class CommentsController <ApplicationController
  before_action :prop_task

  def create
    @comment = Comment.new(comment_params.merge(task_id: params[:task_id]))
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to project_task_path(@task[:project_id], @task[:id])
    else
      redirect_to project_task_path(@task[:project_id], @task[:id])
    end
  end

  private

  def prop_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end
end
