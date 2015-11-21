require 'rails_helper'

RSpec.describe "ProjectDonors", type: :request do
  describe "GET /project_donors" do
    it "works! (now write some real specs)" do
      get project_donors_path
      expect(response).to have_http_status(200)
    end
  end
end
