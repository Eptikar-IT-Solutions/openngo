class Member < ActiveRecord::Base
  belongs_to :branch
  belongs_to :role

  has_many :project_members
  has_many :projects, through: :project_members

  has_many :activity_members
  has_many :projects, through: :activity_members

	validates :name, :uniqueness => true
	validates :active, presence: true
	validates :name, :email, :mobile, :presence => true

end
