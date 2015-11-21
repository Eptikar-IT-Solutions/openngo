require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :state_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_state_id[name=?]", "location[state_id]"

      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
