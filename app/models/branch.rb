class Branch < ActiveRecord::Base
  has_many :projects
  has_many :members
  belongs_to :state  
   
  validates :name, uniqueness: true, presence: true

  translates :name, :description, fallbacks_for_empty_translations: true 
  accepts_nested_attributes_for :translations
end
