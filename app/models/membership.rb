class Membership < ActiveRecord::Base

  validates :user, presence: true
  validates :user, uniqueness: {scope: :project_id, message: "has already been added to this project" }

  ROLE_MEMBER = "Member"
  ROLE_USER = "User"
  ROLE = [ROLE_MEMBER, ROLE_USER]

  belongs_to :project
  belongs_to :user

end
