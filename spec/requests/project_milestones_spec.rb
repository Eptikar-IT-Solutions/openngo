require 'rails_helper'

RSpec.describe "ProjectMilestones", type: :request do
  describe "GET /project_milestones" do
    it "works! (now write some real specs)" do
      get project_milestones_path
      expect(response).to have_http_status(200)
    end
  end
end
