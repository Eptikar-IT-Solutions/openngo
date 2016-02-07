require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :maximum_members}


  it { should belong_to :activity }

  it { should have_many :task_members }
  it { should have_many(:members).through(:task_members) }



  describe "trello integration" do
    before(:context) do
      ENV['TRELLO_KEY'] = SecureRandom.uuid
      organization = FactoryGirl.create(:organization, name: 'test_organization', trello_member_token: SecureRandom.uuid)
      stub_request(:post, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea522c91e31d174600027e",
                "name": "Test List"
        }]
      }', headers: {})
      @checklist_stub = stub_request(:get, /api.trello.com\/1\/checklists/).to_return(status: 200, body: '{
        "id": "4eea6ae1a5da7f5a49000092",
        "name": "To Do",
        "checkItems": [],
              "cards": [{
                "id": "4eea522c91e31d174600027e",
                "name": "Test List"
        }]
      }', headers: {})
      @item_stub = stub_request(:post, /api.trello.com\/1\/checklists\/[a-zA-Z0-9]\/checkItems/).to_return(status: 200, body: ' {
        "state": "incomplete",
        "id": "4eea6af4a5da7f5a490000e1",
        "name": "Test Item",
        "nameData": null,
        "pos": 50647
      }', headers: {})
      @activity = FactoryGirl.create(:activity)
      @task = FactoryGirl.create(:task, activity: @activity)
    end

    it "should create a checklist item in activity card" do
      expect(@task.item).to eq "4eea6af4a5da7f5a490000e1"
    end

  end

end
