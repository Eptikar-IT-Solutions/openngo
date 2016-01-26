class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def update_board(args)
    puts '################################################'
    puts args
    puts '################################################'
    case json_body["action"]["data"]["old"].keys.first
      when "desc"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(description: json_body["action"]["data"]["board"]["desc"]) 
      when "name"
        Project.find_by(board: json_body["model"]["id"]).update_attributes(name: json_body["action"]["data"]["board"]["name"])   
    end 
  end

  def webhook_secret
    ENV['TRELLO_SECRET']
    puts '#################event###############################'
    puts event
    puts '############request_body####################################'
    puts request_body
    puts '#########json_body3#############'
    puts json_body
    puts '############normalized_body####################################'
    puts "#{request_body}#{request_url}".unpack('U*').pack('c*')
    puts '######################3request.body'
    puts request.body
  end
end
 TrelloWebhook::Processor::SignatureError (Actual: 4ipCjUQ6OH1OyFR0Q7jbjJhxw6Q=, Expected: +HRF5Qx0M72zJdUIVueBUgYFlcw=):