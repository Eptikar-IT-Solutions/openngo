require "rails_helper"

RSpec.describe ActivityLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activity_locations").to route_to("activity_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/activity_locations/new").to route_to("activity_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/activity_locations/1").to route_to("activity_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activity_locations/1/edit").to route_to("activity_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/activity_locations").to route_to("activity_locations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/activity_locations/1").to route_to("activity_locations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/activity_locations/1").to route_to("activity_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activity_locations/1").to route_to("activity_locations#destroy", :id => "1")
    end

  end
end
