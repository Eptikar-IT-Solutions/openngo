class Member < ActiveRecord::Base
  belongs_to :branch
  belongs_to :role

  has_many :project_members
  has_many :projects, through: :project_members

  has_many :activity_members
  has_many :projects, through: :activity_members

  has_attached_file :avatar, styles:  { :small => "150x150>",thumb: "100x100" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :name, :uniqueness => true
	validates :active, presence: true
	validates :name, :email, :mobile, :presence => true

end
