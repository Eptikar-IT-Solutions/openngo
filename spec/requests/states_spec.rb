require 'rails_helper'

RSpec.describe "States", type: :request do
  describe "GET /states" do
    it "works! (now write some real specs)" do
      get states_path
      expect(response).to have_http_status(200)
    end
  end
end
