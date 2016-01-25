require "rails_helper"

RSpec.describe LinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/lines").to route_to("lines#index")
    end

    it "routes to #new" do
      expect(:get => "/lines/new").to route_to("lines#new")
    end

    it "routes to #show" do
      expect(:get => "/lines/1").to route_to("lines#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/lines/1/edit").to route_to("lines#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/lines").to route_to("lines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/lines/1").to route_to("lines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/lines/1").to route_to("lines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/lines/1").to route_to("lines#destroy", :id => "1")
    end

  end
end
