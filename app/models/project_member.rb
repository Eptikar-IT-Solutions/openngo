class ProjectMember < ActiveRecord::Base
  include StampableRelations
  
	belongs_to :member
	belongs_to :project
  belongs_to :role
  
end
