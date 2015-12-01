class ProjectMilestone < ActiveRecord::Base
  belongs_to :project

  validates :name, uniqueness: true 
  validates :name, :expences, presence: true
  validates :expences, numericality: true 
end
