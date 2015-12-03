require 'rails_helper'

RSpec.describe "ProjectRoles", type: :request do
  describe "GET /project_roles" do
    it "works! (now write some real specs)" do
      get project_roles_path
      expect(response).to have_http_status(200)
    end
  end
end
