class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor
  
  def board_webhooks
    case json_body["action"]["data"]["old"].keys.first
      when "desc"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(description: json_body["action"]["data"]["board"]["desc"]) 
      when "name"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(name: json_body["action"]["data"]["board"]["name"])   
    end 
  end

  def webhook_secret
    ENV['TRELLO_KEY']
  end
end
