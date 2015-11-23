require 'rails_helper'

RSpec.describe "activity_members/edit", type: :view do
  before(:each) do
    @activity_member = assign(:activity_member, ActivityMember.create!(
      :activity_id => 1,
      :member_id => 1,
      :role_id => 1
    ))
  end

  it "renders the edit activity_member form" do
    render

    assert_select "form[action=?][method=?]", activity_member_path(@activity_member), "post" do

      assert_select "input#activity_member_activity_id[name=?]", "activity_member[activity_id]"

      assert_select "input#activity_member_member_id[name=?]", "activity_member[member_id]"

      assert_select "input#activity_member_role_id[name=?]", "activity_member[role_id]"
    end
  end
end
