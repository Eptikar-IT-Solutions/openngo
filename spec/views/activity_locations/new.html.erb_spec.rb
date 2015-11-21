require 'rails_helper'

RSpec.describe "activity_locations/new", type: :view do
  before(:each) do
    assign(:activity_location, ActivityLocation.new(
      :activity_id => 1,
      :location_id => 1
    ))
  end

  it "renders new activity_location form" do
    render

    assert_select "form[action=?][method=?]", activity_locations_path, "post" do

      assert_select "input#activity_location_activity_id[name=?]", "activity_location[activity_id]"

      assert_select "input#activity_location_location_id[name=?]", "activity_location[location_id]"
    end
  end
end
