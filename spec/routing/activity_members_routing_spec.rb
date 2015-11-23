require "rails_helper"

RSpec.describe ActivityMembersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activity_members").to route_to("activity_members#index")
    end

    it "routes to #new" do
      expect(:get => "/activity_members/new").to route_to("activity_members#new")
    end

    it "routes to #show" do
      expect(:get => "/activity_members/1").to route_to("activity_members#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activity_members/1/edit").to route_to("activity_members#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/activity_members").to route_to("activity_members#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/activity_members/1").to route_to("activity_members#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/activity_members/1").to route_to("activity_members#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activity_members/1").to route_to("activity_members#destroy", :id => "1")
    end

  end
end
