require 'rails_helper'

RSpec.describe "project_locations/new", type: :view do
  before(:each) do
    assign(:project_location, ProjectLocation.new(
      :project_id => 1,
      :location_id => 1
    ))
  end

  it "renders new project_location form" do
    render

    assert_select "form[action=?][method=?]", project_locations_path, "post" do

      assert_select "input#project_location_project_id[name=?]", "project_location[project_id]"

      assert_select "input#project_location_location_id[name=?]", "project_location[location_id]"
    end
  end
end
