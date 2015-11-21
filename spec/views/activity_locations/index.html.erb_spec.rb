require 'rails_helper'

RSpec.describe "activity_locations/index", type: :view do
  before(:each) do
    assign(:activity_locations, [
      ActivityLocation.create!(
        :activity_id => 1,
        :location_id => 2
      ),
      ActivityLocation.create!(
        :activity_id => 1,
        :location_id => 2
      )
    ])
  end

  it "renders a list of activity_locations" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
