require 'rails_helper'

RSpec.describe "project_locations/show", type: :view do
  before(:each) do
    @project_location = assign(:project_location, ProjectLocation.create!(
      :project_id => 1,
      :location_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
