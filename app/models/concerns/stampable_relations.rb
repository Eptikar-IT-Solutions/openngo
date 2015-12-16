module StampableRelations
  extend ActiveSupport::Concern
  
  included do
    belongs_to :creator, foreign_key: "created_by", class_name: "User"
    belongs_to :updater, foreign_key: "update_by", class_name: "User"
  end
end