require 'rails_helper'

RSpec.describe "project_members/new", type: :view do
  before(:each) do
    assign(:project_member, ProjectMember.new(
      :project_id => 1,
      :member_id => 1,
      :role_id => 1
    ))
  end

  it "renders new project_member form" do
    render

    assert_select "form[action=?][method=?]", project_members_path, "post" do

      assert_select "input#project_member_project_id[name=?]", "project_member[project_id]"

      assert_select "input#project_member_member_id[name=?]", "project_member[member_id]"

      assert_select "input#project_member_role_id[name=?]", "project_member[role_id]"
    end
  end
end
