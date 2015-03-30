class ProjectManagement


   def self.assign_current_user_as_project_owner(project, user)
	   project.memberships.create(user: user, role: 'Owner')
	 end


end
