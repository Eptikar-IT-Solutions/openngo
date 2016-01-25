class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts '##########################################OVER HERE############'
    puts event
    puts json_body
    puts '####################333board#########'
    puts json_body["action"]["data"]["board"]
    puts '####################card#########'
    puts json_body["action"]["data"]["card"]
    puts '##########################################OVER HERE############'
    if event == "create_card"
      Activity.create(name: json_body["action"]["data"]["card"]["name"])
    elsif event == "update_board"
     Project.find_by(board_id: json_body["model"]["id"]).update_attributes(name: json_body["action"]["data"]["board"]["name"], description: json_body["model"]["desc"]) 
    # elsif event = "update_card"
    #     Activity.update(status:  json_body["action"]["data"]["card"]["idList"])
    end  
    ENV['TRELLO_KEY']
  end
end