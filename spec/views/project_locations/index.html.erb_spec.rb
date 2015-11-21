require 'rails_helper'

RSpec.describe "project_locations/index", type: :view do
  before(:each) do
    assign(:project_locations, [
      ProjectLocation.create!(
        :project_id => 1,
        :location_id => 2
      ),
      ProjectLocation.create!(
        :project_id => 1,
        :location_id => 2
      )
    ])
  end

  it "renders a list of project_locations" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
