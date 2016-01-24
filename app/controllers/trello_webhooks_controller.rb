class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts '##########################################OVER HERE############'
    puts event
    puts '##########################################OVER HERE############'
    ENV['TRELLO_KEY']
  end
end