require 'rails_helper'

RSpec.describe "ProjectPartners", type: :request do
  describe "GET /project_partners" do
    it "works! (now write some real specs)" do
      get project_partners_path
      expect(response).to have_http_status(200)
    end
  end
end
