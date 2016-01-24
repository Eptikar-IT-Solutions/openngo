class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts '##########################################OVER HERE############'
    puts event
    puts '####################333board#########'
    puts json_body["action"]["data"]["board"]
    puts '####################card#########'
    puts json_body["action"]["data"]["card"]
    puts '##########################################OVER HERE############'
    ENV['TRELLO_KEY']
  end
end