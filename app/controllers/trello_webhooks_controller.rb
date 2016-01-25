class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts '##########################################OVER HERE############'
    puts event
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^#{json_body}'
    puts json_body
    puts '####################333board#########'
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^^^^^#{board}'
    puts json_body["action"]["data"]["board"]
    puts '####################card#########'
    puts '^^^^^^^^^^^^^^^^^^^^json_body^^^^^^^^^^#{card}'
    puts json_body["action"]["data"]["card"]
    puts '##########################################OVER HERE############'

    if event == "create_card"
      Activity.create(name: json_body["action"]["data"]["card"]["name"], project_id: Project.find_by(board_id: json_body["model"]["id"]))
    elsif event == "update_board"
      if json_body["action"]["data"]["old"].include? "name"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(name: json_body["action"]["data"]["board"]["name"]) 
      elsif  json_body["action"]["data"]["old"].include? "desc"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(description: json_body["action"]["data"]["board"]["desc"], description: json_body["model"]["desc"]) 
      end  
    # elsif event = "update_card"
    #     Activity.update(status:  json_body["action"]["data"]["card"]["idList"])
    end  
    ENV['TRELLO_KEY']
  end
end