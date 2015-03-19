namespace :cleanup do

  desc "Removes all memberships where their users have already been deleted"
  task members: :environment do
    orphaned_user_memberships = Membership.where.not(user_id: User.pluck(:id)).delete_all
    puts "#{orphaned_user_memberships} removed memberships where users had been deleted"
  end

  desc "Removes all memberships where their projects have already been deleted"
  task member: :environment do
    orphaned_project_memberships = Membership.where.not(project_id: Project.pluck(:id)).delete_all
    puts "#{orphaned_project_memberships} removed memberships where projects had been deleted"
  end

  desc "Removes all tasks where their projects have been deleted"
  task tasks: :environment do
   orphaned_tasks = Task.where.not(project_id: Project.pluck(:id)).delete_all
   puts "#{orphaned_tasks} removed tasks where projects had been deleted"
  end

  desc "Removes all comments where their tasks have been deleted"
  task comments: :environment do
    remove_orphaned_comments = Comment.where.not(task_id: Task.pluck(:id)).delete_all
    puts "#{remove_orphaned_comments} removed comments where tasks were deleted"
  end

  desc "Sets the user_id of comments to nil if their users have been deleted"
  task user_id: :environment do
    update_comment_user_id = Comment.where.not(user_id: User.pluck(:id)).update_all(user_id: nil)
    puts "#{update_comment_user_id} user_id was updated to nil when user was deleted"
  end

  desc "Removes any tasks with null project_id"
  task task: :environment do
    remove_tasks_null_project_id = Task.where(project_id: nil).delete_all
    puts "#{remove_tasks_null_project_id} tasks were deleted without a project_id"
  end

  desc "Removes any comments with a null task_id"
  task comment: :environment do
    remove_tasks_null_project_id = Task.where(project_id: nil).delete_all
    puts "#{remove_tasks_null_project_id} tasks were deleted without a project_id"
  end

  desc "Removes any memberships with a null project_id or user_id"
  task membership: :environment do
    remove_null_ids = Membership.where(project_id = nil && user_id = nil).delete_all
    puts "#{remove_null_ids} memberships were removed with a null project_id and user_id"
  end



end
