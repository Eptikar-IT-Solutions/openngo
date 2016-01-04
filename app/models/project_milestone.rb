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
  
  after_save :update_project_overall_expences
  before_destroy :remove_all_activities

  private
    def update_project_overall_expences
      self.project.update(overall_expences: self.project.overall_expences + self.expences)
    end

    def remove_all_activities
      PublicActivity::Activity.destroy_all(:trackable => self)
    end
end
