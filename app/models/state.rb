class State < ActiveRecord::Base
	has_many :locations

	validates :name, uniqueness: true
	validates :name, presence: true

  translates :name, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations
end
