require 'trello'

class Project < ActiveRecord::Base
  include Taggable

  enum currency: [ :USD, :SDG, :EUR ]

	belongs_to :branch
  has_many :project_milestones

  has_many :project_attachments

  belongs_to :location

  belongs_to :organization

  has_many :project_members
  has_many :members, through: :project_members
  
	has_many :project_donors
  has_many :donors, through: :project_donors


  has_many :project_roles
  has_many :roles, through: :project_roles

  has_many :project_partners
  has_many :organizations, through: :project_partners

	validates :name, uniqueness: true
	validates :name, :goal, :budget, presence: true
 	validates :budget, numericality: { allow_blank: true }

  accepts_nested_attributes_for :project_attachments
  accepts_nested_attributes_for :members  

  translates :name, :description, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations
  
  private
    def create_trello_board
      organization = Organization.first

      if organization.trello_member_token
        Trello.configure do |config|
          config.developer_public_key = ENV['TRELLO_KEY']
          config.member_token = organization.trello_member_token
        end

        board = Trello::Board.create(
          name: self.name,
          description: self.description
        )
        Trello::Webhook.create(description: "A webhook that update project model every time the card updated", id_model: board.id, callback_url: "https://blooming-woodland-20439.herokuapp.com/trello_webhooks")
        self.update(board: board.id)
      end
    end
end
