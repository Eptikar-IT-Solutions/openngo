require 'trello'

Trello.configure do |config|
  config.developer_public_key = ENV['TRELLO-KEY'] 
  config.member_token = ENV['TRELLO-MEMBER-TOKEN']
end  