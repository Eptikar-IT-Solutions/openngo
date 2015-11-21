require 'rails_helper'

RSpec.describe "activity_locations/edit", type: :view do
  before(:each) do
    @activity_location = assign(:activity_location, ActivityLocation.create!(
      :activity_id => 1,
      :location_id => 1
    ))
  end

  it "renders the edit activity_location form" do
    render

    assert_select "form[action=?][method=?]", activity_location_path(@activity_location), "post" do

      assert_select "input#activity_location_activity_id[name=?]", "activity_location[activity_id]"

      assert_select "input#activity_location_location_id[name=?]", "activity_location[location_id]"
    end
  end
end
