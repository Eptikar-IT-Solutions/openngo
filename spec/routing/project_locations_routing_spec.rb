require "rails_helper"

RSpec.describe ProjectLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_locations").to route_to("project_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/project_locations/new").to route_to("project_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/project_locations/1").to route_to("project_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_locations/1/edit").to route_to("project_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_locations").to route_to("project_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_locations/1").to route_to("project_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_locations/1").to route_to("project_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_locations/1").to route_to("project_locations#destroy", :id => "1")
    end

  end
end
