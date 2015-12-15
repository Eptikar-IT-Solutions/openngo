class ProjectMilestone < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :project

  validates :name, uniqueness: true 
  validates :name, :expences, presence: true
  validates :expences, numericality: true 

  after_save :update_project_overall_expences

  private
    def update_project_overall_expences
      project = self.project
      project.update(overall_expences: project.overall_expences + self.expences)
    end
end
