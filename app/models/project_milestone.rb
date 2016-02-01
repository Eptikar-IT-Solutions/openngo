class ProjectMilestone < ActiveRecord::Base
  include StampableRelations
  include PublicActivity::Model

  tracked owner: proc { |controller, model| model.updater }
  
  belongs_to :project

  validates :name, uniqueness: true 
  validates :name, :expences, presence: true
  validates :expences, numericality: true 

  translates :name, :description, fallbacks_for_empty_translations: true
  
  accepts_nested_attributes_for :translations

  before_destroy :remove_all_activities

  private
    def remove_all_activities
      PublicActivity::Activity.destroy_all(:trackable => self)
    end
end
