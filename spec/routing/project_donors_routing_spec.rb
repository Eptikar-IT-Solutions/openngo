require "rails_helper"

RSpec.describe ProjectDonorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_donors").to route_to("project_donors#index")
    end

    it "routes to #new" do
      expect(:get => "/project_donors/new").to route_to("project_donors#new")
    end

    it "routes to #show" do
      expect(:get => "/project_donors/1").to route_to("project_donors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_donors/1/edit").to route_to("project_donors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_donors").to route_to("project_donors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_donors/1").to route_to("project_donors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_donors/1").to route_to("project_donors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_donors/1").to route_to("project_donors#destroy", :id => "1")
    end

  end
end
