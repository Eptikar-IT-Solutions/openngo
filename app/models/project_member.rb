class ProjectMember < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
  
	belongs_to :member
	belongs_to :project
  belongs_to :role
end
