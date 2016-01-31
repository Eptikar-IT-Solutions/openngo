class Location < ActiveRecord::Base
	belongs_to :state
	has_many :project_locations
  has_many :projects, through: :project_locations

	has_many :activity_locations
  has_many :activities, through: :activity_locations

  translates :name, fallbacks_for_empty_translations: true

  accepts_nested_attributes_for :translations
end
