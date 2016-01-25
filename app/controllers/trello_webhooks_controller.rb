class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts '##########################################OVER HERE############'
    puts event
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^#{json_body}'
    board =  json_body["action"]["data"]["board"]
    puts '####################333board#########'
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^#{board}'
    card =  json_body["action"]["data"]["card"]
    puts '####################card#########'
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^#{card}'
    puts '##########################################OVER HERE############'
    if event == "create_card"
      Activity.create(name: json_body["action"]["data"]["card"]["name"], project_id: Project.find_by(board_id: json_body["model"]["id"]))
    elsif event == "update_board"
     Project.find_by(board_id: json_body["model"]["id"]).update_attributes(name: json_body["action"]["data"]["board"]["name"], description: json_body["model"]["desc"]) 
    # elsif event = "update_card"
    #     Activity.update(status:  json_body["action"]["data"]["card"]["idList"])
    end  
    ENV['TRELLO_KEY']
  end
end