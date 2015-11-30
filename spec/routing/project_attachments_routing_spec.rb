require "rails_helper"

RSpec.describe ProjectAttachmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_attachments").to route_to("project_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/project_attachments/new").to route_to("project_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/project_attachments/1").to route_to("project_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_attachments/1/edit").to route_to("project_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_attachments").to route_to("project_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_attachments/1").to route_to("project_attachments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_attachments/1").to route_to("project_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_attachments/1").to route_to("project_attachments#destroy", :id => "1")
    end

  end
end
