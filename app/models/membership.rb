class Membership < ActiveRecord::Base

  ROLE_MEMBER = "Member"
  ROLE_USER = "User"
  ROLE = [ROLE_MEMBER, ROLE_USER]

  belongs_to :project
  belongs_to :user

end
