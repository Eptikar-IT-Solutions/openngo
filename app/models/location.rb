class Location < ActiveRecord::Base
	belongs_to :state
	has_many :project_locations
  has_many :locations, through: :project_locations

	has_many :activity_locations
  has_many :locations, through: :activity_locations
end
