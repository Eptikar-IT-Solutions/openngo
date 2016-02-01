class Location < ActiveRecord::Base
	belongs_to :state

  has_many :projects
  has_many :activities

  translates :name, fallbacks_for_empty_translations: true

  accepts_nested_attributes_for :translations
end
