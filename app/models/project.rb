require 'trello'
require 'action_view'

class Project < ActiveRecord::Base
  include Taggable
  include ActionView::Helpers::DateHelper

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
  
  acts_as_messageable subscribers: Proc.new { |project| project.members.collect{ |member| member.user}}, conversation_types: ['Upload Project Attachment Request', 'Announcement', 'Call For Volunteers'],
    hooks: {
      upload_project_attachment_request: Proc.new { |dady, fields, messageable| 
        project_attachment = ProjectAttachment.create(project_id: messageable.id) 
        project_attachment.file = dady.attachment 
        project_attachment.save!
        message = dady.message

        default_locale = I18n.locale
        I18n.locale = :en
        message.update(body: "<a href=/project_attachments/#{project_attachment.id}>#{project_attachment.file_file_name}</a> was recieved #{Project.new.distance_of_time_in_words(message.created_at, project_attachment.created_at)} later at #{project_attachment.created_at.strftime("%d-%m-%Y %H:%M %p")}", alert_class: "alert-success", system_message: true)
        I18n.locale = :ar
        Message::Translation.create!(message_id: message.id, locale: 'ar', body: "لقد تم إستلام مستتند <a href=/project_attachments/#{project_attachment.id}>#{project_attachment.attachment_file_name}</a> في   #{Project.new.distance_of_time_in_words(message.created_at, project_attachment.created_at)}  لاحقا في #{project_attachment.created_at.strftime("%d-%m-%Y %H:%M %p")}")
        I18n.locale = default_locale
      },
      call_for_volunteers: Proc.new{|dady|
        user = User.find(dady.created_by)
        project_member = ProjectMember.create(member_id: Member.find(user.member_id), project_id: dady.conversation.messageable.id)     
        default_locale = I18n.locale
        I18n.locale = :en
        dady.update(body: "<a href=/users/#{dady.created_by}>#{project_member.member.name}</a> has_joined  the project", system_message: true, alert_class: 'alert-success',attributes: {locale: 'ar', body: "لقد انضم <a href=/users/#{dady.created_by}>#{project_member.member.name} إلى المشروع"})
        I18n.locale = default_locale
      }  
    }

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
