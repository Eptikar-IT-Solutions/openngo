require 'rails_helper'

RSpec.describe "ProjectLocations", type: :request do
  describe "GET /project_locations" do
    it "works! (now write some real specs)" do
      get project_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
