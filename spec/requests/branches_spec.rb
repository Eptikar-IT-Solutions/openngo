require 'rails_helper'

RSpec.describe "Branches", type: :request do
  describe "GET /branches" do
    it "works! (now write some real specs)" do
      get branches_path
      expect(response).to have_http_status(200)
    end
  end
end
