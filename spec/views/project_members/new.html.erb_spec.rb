require 'rails_helper'

RSpec.describe "project_members/new", type: :view do
  before(:each) do
    assign(:project_member, ProjectMember.new(
      :project_id => 1,
      :member_id => 1,
      :member_type => 1
    ))
  end

  it "renders new project_member form" do
    render

    assert_select "form[action=?][method=?]", project_members_path, "post" do

      assert_select "input#project_member_project_id[name=?]", "project_member[project_id]"

      assert_select "input#project_member_member_id[name=?]", "project_member[member_id]"

      assert_select "input#project_member_member_type[name=?]", "project_member[member_type]"
    end
  end
end
