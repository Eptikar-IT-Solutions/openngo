require 'rails_helper'

RSpec.describe "project_milestones/edit", type: :view do
  before(:each) do
    @project_milestone = assign(:project_milestone, ProjectMilestone.create!(
      :name => "MyString",
      :description => "MyText",
      :expences => "9.99",
      :project_id => 1
    ))
  end

  it "renders the edit project_milestone form" do
    render

    assert_select "form[action=?][method=?]", project_milestone_path(@project_milestone), "post" do

      assert_select "input#project_milestone_name[name=?]", "project_milestone[name]"

      assert_select "textarea#project_milestone_description[name=?]", "project_milestone[description]"

      assert_select "input#project_milestone_expences[name=?]", "project_milestone[expences]"

      assert_select "input#project_milestone_project_id[name=?]", "project_milestone[project_id]"
    end
  end
end
