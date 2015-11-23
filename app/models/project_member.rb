class ProjectMember < ActiveRecord::Base
	belongs_to :member
	belongs_to :project
  belongs_to :role
end
