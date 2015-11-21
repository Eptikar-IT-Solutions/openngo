require "rails_helper"

RSpec.describe ProjectPartnersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_partners").to route_to("project_partners#index")
    end

    it "routes to #new" do
      expect(:get => "/project_partners/new").to route_to("project_partners#new")
    end

    it "routes to #show" do
      expect(:get => "/project_partners/1").to route_to("project_partners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_partners/1/edit").to route_to("project_partners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_partners").to route_to("project_partners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_partners/1").to route_to("project_partners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_partners/1").to route_to("project_partners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_partners/1").to route_to("project_partners#destroy", :id => "1")
    end

  end
end
