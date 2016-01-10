require 'csv'
require 'rails/all'

class Activity < ActiveRecord::Base   
  include StampableRelations
  include PublicActivity::Model
  tracked owner: proc { |controller, model| model.updater }
   
  belongs_to :project
  belongs_to :branch
  
  belongs_to :location
  # has_many :activity_locations
  # has_many :locations, through: :activity_locations

  has_many :activity_members
  has_many :members, through: :activity_members
    
	validates :name, uniqueness: true, presence: true
	validates :budget, numericality: true

  translates :name, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations
  
  before_destroy :remove_all_activities 

  def to_ics
    cal = Icalendar::Calendar.new
    cal.event do |event|
      event.dtstart = self.from
      event.dtstart = self.to
      event.summary = self.name
      event.description = self.description
    end  
  end
  
  def locations_names
    locations = self.locations
    locations_array = Array.new()
    locations.each do |location|
      locations_array.push(location.name)
    end  
    return locations_array
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ["Subject", "Start Date", "End Date", "Description", "Location"]
      all.each do |activity|
        csv << [activity.name, activity.from, activity.to, activity.description, activity.locations_names]
      end
    end
  end

  def remove_all_activities
    PublicActivity::Activity.destroy_all(:trackable => self)
  end
end
