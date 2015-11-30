require "rails_helper"

RSpec.describe ProfessionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/professions").to route_to("professions#index")
    end

    it "routes to #new" do
      expect(:get => "/professions/new").to route_to("professions#new")
    end

    it "routes to #show" do
      expect(:get => "/professions/1").to route_to("professions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/professions/1/edit").to route_to("professions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/professions").to route_to("professions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/professions/1").to route_to("professions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/professions/1").to route_to("professions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/professions/1").to route_to("professions#destroy", :id => "1")
    end

  end
end
