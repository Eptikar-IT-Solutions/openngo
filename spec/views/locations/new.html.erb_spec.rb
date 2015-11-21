require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :state_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_state_id[name=?]", "location[state_id]"

      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
