class Project < ActiveRecord::Base

  validates :name, presence: true

  has_many :tasks, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

end
