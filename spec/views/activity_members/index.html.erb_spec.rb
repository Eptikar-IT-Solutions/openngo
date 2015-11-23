require 'rails_helper'

RSpec.describe "activity_members/index", type: :view do
  before(:each) do
    assign(:activity_members, [
      ActivityMember.create!(
        :activity_id => 1,
        :member_id => 2,
        :role_id => 3
      ),
      ActivityMember.create!(
        :activity_id => 1,
        :member_id => 2,
        :role_id => 3
      )
    ])
  end

  it "renders a list of activity_members" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
