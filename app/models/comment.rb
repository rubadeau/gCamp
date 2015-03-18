class Comment <ActiveRecord::Base
  validates :content, presence: true

  belongs_to :task
  belongs_to :user

end
