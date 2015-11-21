require 'rails_helper'

RSpec.describe "ActivityLocations", type: :request do
  describe "GET /activity_locations" do
    it "works! (now write some real specs)" do
      get activity_locations_path
      expect(response).to have_http_status(200)
    end
  end
end
