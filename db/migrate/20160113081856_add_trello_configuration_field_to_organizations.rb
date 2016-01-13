class AddTrelloConfigurationFieldToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :trello_member_token, :string
  end
end
