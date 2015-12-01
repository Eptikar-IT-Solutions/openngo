class Project < ActiveRecord::Base
	belongs_to :branch
  has_many :project_milestones

  has_many :project_attachments
  has_many :attachments, through: :project_attachments
  
	has_many :project_locations
  has_many :locations, through: :project_locations

	has_many :project_donors
  has_many :donors, through: :project_donors

  has_many :project_partners
  has_many :organizations, through: :project_partners
  accepts_nested_attributes_for :attachments, :reject_if =>  proc { |attributes| attributes['name'].blank? }, :allow_destroy => true
  
	validates :name, uniqueness: true 
	validates :name, :goal, :budget, presence: true
 	validates :budget, numericality: true 
end