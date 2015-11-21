require "rails_helper"

RSpec.describe BranchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/branches").to route_to("branches#index")
    end

    it "routes to #new" do
      expect(:get => "/branches/new").to route_to("branches#new")
    end

    it "routes to #show" do
      expect(:get => "/branches/1").to route_to("branches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/branches/1/edit").to route_to("branches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/branches").to route_to("branches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/branches/1").to route_to("branches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/branches/1").to route_to("branches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/branches/1").to route_to("branches#destroy", :id => "1")
    end

  end
end
