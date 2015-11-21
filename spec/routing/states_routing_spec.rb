require "rails_helper"

RSpec.describe StatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/states").to route_to("states#index")
    end

    it "routes to #new" do
      expect(:get => "/states/new").to route_to("states#new")
    end

    it "routes to #show" do
      expect(:get => "/states/1").to route_to("states#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/states/1/edit").to route_to("states#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/states").to route_to("states#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/states/1").to route_to("states#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/states/1").to route_to("states#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/states/1").to route_to("states#destroy", :id => "1")
    end

  end
end
