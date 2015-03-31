def create_user(options= {})
  User.create!({
    first_name: 'Bruce',
    last_name: 'Willis',
    email: 'bamf@diehard.com',
    password: 'quitelikeamouse',
    admin: true
  }.merge(options))
end

def create_project(options= {})
  Project.create!({
    name: 'Test Project',
  }.merge(options))
end

def create_membership(user, project, options = {})
  Membership.create!({
    role: "Owner",
    :user_id => user.id,
    :project_id => project.id,
  }.merge(options))
end

def create_task(project, options = {})
  Task.create!({
   description: 'tesing project tasks',
   :project_id => project.id,
   due_date: "2015-11-15",
   complete: true,
  }.merge(options))
end

def create_comment(user, task, options = {})
  Comment.create!({
    message: "testing task comments",
    :user_id => user.id,
    :task_id => task.id,
  }.merge(options))
end
