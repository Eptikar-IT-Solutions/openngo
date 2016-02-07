require 'rails_helper'

RSpec.describe Project, type: :model do
    it {should validate_presence_of :name}
    it {should validate_presence_of :goal}
    it {should validate_presence_of :budget}
    it {should validate_uniqueness_of :name}

	it {should belong_to :branch }
    it { should belong_to(:location)}

	it { should have_many :project_milestones }

    it { should have_many :project_donors}
    it { should have_many(:donors).through(:project_donors) }
    it { should have_many :project_partners }
    it { should have_many(:organizations).through(:project_partners) }
    it { should have_many :project_roles }
    it { should have_many(:roles).through(:project_roles) }
    it {should validate_numericality_of :budget}

    it "should have a valid factory" do
    expect(FactoryGirl.build(:project)).to be_valid
  end

  describe "trello integration" do
    before(:context) do
      ENV['TRELLO_KEY'] = SecureRandom.uuid
      organization = FactoryGirl.create(:organization, name: 'test_organization', trello_member_token: SecureRandom.uuid)
      @project = FactoryGirl.create(:project)
      @board_stub = stub_request(:post, /api.trello.com\/1\/boards/).to_return(status: 200, body: '{
          "id": "4eea4ffc91e31d1746000046",
          "name": "Example Board",
          "desc": "This board is used in the API examples",
          "lists": [{
              "id": "4eea4ffc91e31d174600004a",
              "name": "To Do Soon"
          }, {
              "id": "4eea4ffc91e31d174600004b",
              "name": "Doing"
          }, {
              "id": "4eea4ffc91e31d174600004c",
              "name": "Done"
          }]
      }', headers: {})
      @webhook_stub = stub_request(:post, /api.trello.com\/1\/webhooks/).to_return(status: 200, body: '{}', headers: {})
      @project.send(:create_trello_board)
    end

    it "should call the correct request for board creation" do
      expect(@board_stub).to have_been_requested
    end

    it "should call the correct request for webhook creation" do
      expect(@webhook_stub).to have_been_requested
    end

    it "should be able to create a trello board" do
      expect(@project.board).to_not be nil
    end

  end
end
