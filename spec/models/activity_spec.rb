require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of  :name }

  it { should belong_to :project }
  it { should belong_to :branch }
  it { should belong_to(:location) }

  it { should have_many :activity_members }
  it { should have_many(:members).through(:activity_members) }

  describe "trello integration" do
    before(:context) do
      ENV['TRELLO_KEY'] = SecureRandom.uuid
      organization = FactoryGirl.create(:organization, name: 'test_organization', trello_member_token: SecureRandom.uuid)
      @activity = FactoryGirl.create(:activity)
    end

    it "should send an appropriate request for card createion" do
      @card_stub = stub_request(:post, /api.trello.com\/1\/cards/).to_return(status: 200, body: '{
        "id": "4eea503d91e31d174600008f",
        "name": "Test Card",
        "idList": "4eea4ffc91e31d174600004b"
      }', headers: {})
      @checklist_stub = stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea503d91e31d174600008f",
                "name": "Test Card"
        }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{"name": "Test Webhook"}', headers: {})
      @activity.send(:create_trello_card_and_checklist)
      expect(@card_stub).to have_been_requested
    end

    it "should send an appropriate request for checklist creation" do
      @card_stub = stub_request(:post, /api.trello.com\/1\/cards/).to_return(status: 200, body: '{
        "id": "4eea503d91e31d174600008f",
        "name": "Test Card",
        "idList": "4eea4ffc91e31d174600004b"
      }', headers: {})
      @checklist_stub = stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea503d91e31d174600008f",
                "name": "Test Card"
        }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{"name": "Test Webhook"}', headers: {})
      @activity.send(:create_trello_card_and_checklist)
      expect(@checklist_stub).to have_been_requested
    end

    it "should send an appropriate request for webhook creation" do
      @card_stub = stub_request(:post, /api.trello.com\/1\/cards/).to_return(status: 200, body: '{
        "id": "4eea503d91e31d174600008f",
        "name": "Test Card",
        "idList": "4eea4ffc91e31d174600004b"
      }', headers: {})
      @checklist_stub = stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea503d91e31d174600008f",
                "name": "Test Card"
        }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{"name": "Test Webhook"}', headers: {})
      @activity.send(:create_trello_card_and_checklist)
      expect(@webhook_stub).to have_been_requested
    end

    it "should create a card and save its id" do
      @card_stub = stub_request(:post, /api.trello.com\/1\/cards/).to_return(status: 200, body: '{
        "id": "4eea503d91e31d174600008f",
        "name": "Test Card",
        "idList": "4eea4ffc91e31d174600004b"
      }', headers: {})
      @checklist_stub = stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea503d91e31d174600008f",
                "name": "Test Card"
        }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{"name": "Test Webhook"}', headers: {})
      @activity.send(:create_trello_card_and_checklist)
      expect(@activity.card).to eq "4eea503d91e31d174600008f"
    end

    it "should create a checklist and save its id" do
      @card_stub = stub_request(:post, /api.trello.com\/1\/cards/).to_return(status: 200, body: '{
        "id": "4eea503d91e31d174600008f",
        "name": "Test Card",
        "idList": "4eea4ffc91e31d174600004b"
      }', headers: {})
      @checklist_stub = stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea503d91e31d174600008f",
                "name": "Test Card"
        }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{"name": "Test Webhook"}', headers: {})
      @activity.send(:create_trello_card_and_checklist)
      expect(@activity.checklist).to eq "4eea6ae1a5da7f5a49000092"
    end

  end

end
