require 'rails_helper'

RSpec.describe "project_roles/edit", type: :view do
  before(:each) do
    @project_role = assign(:project_role, ProjectRole.create!(
      :role_id => 1,
      :project_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit project_role form" do
    render

    assert_select "form[action=?][method=?]", project_role_path(@project_role), "post" do

      assert_select "input#project_role_role_id[name=?]", "project_role[role_id]"

      assert_select "input#project_role_project_id[name=?]", "project_role[project_id]"

      assert_select "textarea#project_role_description[name=?]", "project_role[description]"
    end
  end
end
