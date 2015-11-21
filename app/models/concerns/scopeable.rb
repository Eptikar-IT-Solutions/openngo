module Scopeable
	extend ActiveSupport::Concern

	module ClassMethods
		def add_scope name
			define_singleton_method("has_#{name}") do |value|
				unless value.blank?
					where("#{name} = ?", value )
				else
					all
				end
			end
		end

		def add_search name
			define_singleton_method("search_#{name}") do |value|
				unless value.blank?
					where("#{name} LIKE ?", value)
				else
					all
				end
			end
		end
		
	end

end