class Organization < ActiveRecord::Base

	validates :name, uniqueness: true 
	validates :name, presence: true
	validates :subdomain, uniqueness: true , allow_blank: false

  before_save :fill_website, :if => Proc.new { |organization| organization.website.blank? && !(organization.subdomain.blank?)}

  private
    def fill_website
      self.website = self.subdomain + ".openngo.org"
    end
end
