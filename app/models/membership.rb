class Membership < ActiveRecord::Base
  ROLE = ["Member", "Owner"]
  validates :user, presence: true
  validates :user, uniqueness: {scope: :project_id, message: "has already been added to this project" }
  validates :role, presence: true, inclusion:ROLE

  belongs_to :project
  belongs_to :user

end
