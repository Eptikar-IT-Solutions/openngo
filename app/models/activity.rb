class Activity < ActiveRecord::Base   
  include PublicActivity::Model
  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
   
  belongs_to :project
  belongs_to :branch

  has_many :activity_locations
  has_many :locations, through: :activity_locations

  has_many :activity_members
  has_many :members, through: :activity_members
    
	validates :name, uniqueness: true, presence: true
	validates :budget, numericality: true
end
