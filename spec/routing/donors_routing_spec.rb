require "rails_helper"

RSpec.describe DonorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/donors").to route_to("donors#index")
    end

    it "routes to #new" do
      expect(:get => "/donors/new").to route_to("donors#new")
    end

    it "routes to #show" do
      expect(:get => "/donors/1").to route_to("donors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/donors/1/edit").to route_to("donors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/donors").to route_to("donors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/donors/1").to route_to("donors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/donors/1").to route_to("donors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/donors/1").to route_to("donors#destroy", :id => "1")
    end

  end
end
