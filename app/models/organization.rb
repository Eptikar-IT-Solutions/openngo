class Organization < ActiveRecord::Base
  has_many :project_partners
  has_many :members
  
  has_attached_file :logo, styles:  { :small => "150x150>" }, default_url: "/images/:style/missing.png"

	validates :name, uniqueness: true 
	validates :name, presence: true
	validates :subdomain, uniqueness: true , allow_blank: false
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  accepts_nested_attributes_for :members

  before_save :fill_website, :if => Proc.new { |organization| organization.website.blank? && !(organization.subdomain.blank?)}
  
  private
    def fill_website
      self.website = self.subdomain + ".openngo.org"
    end
end
