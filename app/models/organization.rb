class Organization < ActiveRecord::Base
  has_many :project_partners
  has_many :members
  has_many :projects 
  
	validates :name, uniqueness: true 
	validates :name, presence: true
	validates :subdomain, uniqueness: true , allow_blank: false
  
  has_attached_file :logo, styles:  { :small => "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  translates :name, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations
  
  accepts_nested_attributes_for :members

  before_save :fill_website, :if => Proc.new { |organization| organization.website.blank? && !(organization.subdomain.blank?)}
  after_create :create_trello_organization
  
  after_create :create_trello_organization

  # def create_trello_organization
  #   organization_name = self.name
  #   organization_description =  self.description
  #   organization = Trello::Organization.create(
  #   name: organization_name,
  #   description: organization_description
  #   )
  # end

  private
    def fill_website
      self.website = self.subdomain + ".openngo.org"
    end
end
