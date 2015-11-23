class ProjectDonor < ActiveRecord::Base
	belongs_to :donor
  belongs_to :project
end
