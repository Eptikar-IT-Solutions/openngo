class Member < ActiveRecord::Base
  include Taggable
  
  attr_accessor :other_profession

  enum gender: [ :male, :female ]
  enum education: { "Secondary"=>0, "Bachelor"=>1, "Master"=>2, "Diploma"=>3, "Doctorate"=>4, "Undergraduate"=>5}  

  belongs_to :user 
  belongs_to :branch
  belongs_to :role
  belongs_to :profession
  belongs_to :organization
  has_many :project_roles

  has_many :project_members
  has_many :projects, through: :project_members

  has_many :activity_members
  has_many :activities, through: :activity_members

  has_attached_file :avatar, styles:  { :small => "150x150>",thumb: "100x100" }, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	#validates :name, uniqueness: true
	#validates :name, :email, :mobile, presence: true
end
