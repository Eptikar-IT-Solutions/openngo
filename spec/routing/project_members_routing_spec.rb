require "rails_helper"

RSpec.describe ProjectMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_members").to route_to("project_members#index")
    end

    it "routes to #new" do
      expect(:get => "/project_members/new").to route_to("project_members#new")
    end

    it "routes to #show" do
      expect(:get => "/project_members/1").to route_to("project_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_members/1/edit").to route_to("project_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_members").to route_to("project_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_members/1").to route_to("project_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_members/1").to route_to("project_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_members/1").to route_to("project_members#destroy", :id => "1")
    end

  end
end
