class Branch < ActiveRecord::Base
  has_many :projects
  has_many :members
  belongs_to :state  
   
  validates :name, uniqueness: true, presence: true 
end
