class Branch < ActiveRecord::Base
  has_many :projects
  has_many :members
     
  validates :name, uniqueness: true, presence: true 
end
