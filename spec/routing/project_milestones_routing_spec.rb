require "rails_helper"

RSpec.describe ProjectMilestonesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_milestones").to route_to("project_milestones#index")
    end

    it "routes to #new" do
      expect(:get => "/project_milestones/new").to route_to("project_milestones#new")
    end

    it "routes to #show" do
      expect(:get => "/project_milestones/1").to route_to("project_milestones#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_milestones/1/edit").to route_to("project_milestones#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_milestones").to route_to("project_milestones#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_milestones/1").to route_to("project_milestones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_milestones/1").to route_to("project_milestones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_milestones/1").to route_to("project_milestones#destroy", :id => "1")
    end

  end
end
