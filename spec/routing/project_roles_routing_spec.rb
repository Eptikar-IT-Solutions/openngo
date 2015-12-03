require "rails_helper"

RSpec.describe ProjectRolesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/project_roles").to route_to("project_roles#index")
    end

    it "routes to #new" do
      expect(:get => "/project_roles/new").to route_to("project_roles#new")
    end

    it "routes to #show" do
      expect(:get => "/project_roles/1").to route_to("project_roles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/project_roles/1/edit").to route_to("project_roles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/project_roles").to route_to("project_roles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/project_roles/1").to route_to("project_roles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/project_roles/1").to route_to("project_roles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/project_roles/1").to route_to("project_roles#destroy", :id => "1")
    end

  end
end
