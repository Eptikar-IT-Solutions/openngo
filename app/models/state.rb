class State < ActiveRecord::Base
	has_many :locations

	validates :name, uniqueness: true
	validates :name, presence: true
end
