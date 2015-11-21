require 'rails_helper'

RSpec.describe "project_locations/edit", type: :view do
  before(:each) do
    @project_location = assign(:project_location, ProjectLocation.create!(
      :project_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit project_location form" do
    render

    assert_select "form[action=?][method=?]", project_location_path(@project_location), "post" do

      assert_select "input#project_location_project_id[name=?]", "project_location[project_id]"

      assert_select "input#project_location_location_id[name=?]", "project_location[location_id]"
    end
  end
end
