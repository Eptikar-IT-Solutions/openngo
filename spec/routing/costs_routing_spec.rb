require "rails_helper"

RSpec.describe CostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/costs").to route_to("costs#index")
    end

    it "routes to #new" do
      expect(:get => "/costs/new").to route_to("costs#new")
    end

    it "routes to #show" do
      expect(:get => "/costs/1").to route_to("costs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/costs/1/edit").to route_to("costs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/costs").to route_to("costs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/costs/1").to route_to("costs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/costs/1").to route_to("costs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/costs/1").to route_to("costs#destroy", :id => "1")
    end

  end
end
