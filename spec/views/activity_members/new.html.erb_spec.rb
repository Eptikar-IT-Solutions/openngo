require 'rails_helper'

RSpec.describe "activity_members/new", type: :view do
  before(:each) do
    assign(:activity_member, ActivityMember.new(
      :activity_id => 1,
      :member_id => 1,
      :role_id => 1
    ))
  end

  it "renders new activity_member form" do
    render

    assert_select "form[action=?][method=?]", activity_members_path, "post" do

      assert_select "input#activity_member_activity_id[name=?]", "activity_member[activity_id]"

      assert_select "input#activity_member_member_id[name=?]", "activity_member[member_id]"

      assert_select "input#activity_member_role_id[name=?]", "activity_member[role_id]"
    end
  end
end
