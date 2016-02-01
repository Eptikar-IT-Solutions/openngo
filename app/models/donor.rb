class Donor < ActiveRecord::Base
	has_many :project_donors
  has_many :projects, through: :project_donors
    
  validates :name, uniqueness: true
	validates :name, :email, :phone1, presence: true
  validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ } , allow_blank: true

  translates :name, :description, fallbacks_for_empty_translations: true
  
  accepts_nested_attributes_for :translations
end
