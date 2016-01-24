class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def webhook_secret
    ENV['TRELLO_KEY']
  end
end