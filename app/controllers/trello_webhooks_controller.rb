class TrelloWebhooksController < ActionController::Base
  include TrelloWebhook::Processor

  def update_board
    puts params 
    # project = Project.find_by(trello_board_id: board.id)
    # project.update(name: board.name, description: board.desc)
    render :nothing => true
  end
end