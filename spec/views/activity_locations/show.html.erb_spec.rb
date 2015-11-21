require 'rails_helper'

RSpec.describe "activity_locations/show", type: :view do
  before(:each) do
    @activity_location = assign(:activity_location, ActivityLocation.create!(
      :activity_id => 1,
      :location_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
