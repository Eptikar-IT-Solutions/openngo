require 'rails_helper'

RSpec.describe "ProjectAttachments", type: :request do
  describe "GET /project_attachments" do
    it "works! (now write some real specs)" do
      get project_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end
