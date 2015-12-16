class ProjectMember < ActiveRecord::Base
  include PublicActivity::Model
  include StampableRelations
  tracked owner: proc { |controller, model| model.updater }
  
	belongs_to :member
	belongs_to :project
  belongs_to :role
end
