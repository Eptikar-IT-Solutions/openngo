class ProjectPartner < ActiveRecord::Base
	belongs_to :partner
	belongs_to :project
end
