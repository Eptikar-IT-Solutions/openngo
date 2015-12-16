class ProjectMilestone < ActiveRecord::Base
  include StampableRelations
  include PublicActivity::Model
  tracked owner: proc { |controller, model| model.updater }

  belongs_to :project

  validates :name, uniqueness: true 
  validates :name, :expences, presence: true
  validates :expences, numericality: true 
   
  after_save :update_project_overall_expences

  private
    def update_project_overall_expences
      self.project.update(overall_expences: self.project.overall_expences + self.expences)
    end
end
