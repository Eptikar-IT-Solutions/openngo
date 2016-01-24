class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    puts @event
    ENV['TRELLO_KEY']
  end
end