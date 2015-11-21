require 'rails_helper'

RSpec.describe "ProjectMembers", type: :request do
  describe "GET /project_members" do
    it "works! (now write some real specs)" do
      get project_members_path
      expect(response).to have_http_status(200)
    end
  end
end
