require 'rails_helper'

RSpec.describe "project_milestones/new", type: :view do
  before(:each) do
    assign(:project_milestone, ProjectMilestone.new(
      :name => "MyString",
      :description => "MyText",
      :expences => "9.99",
      :Project_id => 1
    ))
  end

  it "renders new project_milestone form" do
    render

    assert_select "form[action=?][method=?]", project_milestones_path, "post" do

      assert_select "input#project_milestone_name[name=?]", "project_milestone[name]"

      assert_select "textarea#project_milestone_description[name=?]", "project_milestone[description]"

      assert_select "input#project_milestone_expences[name=?]", "project_milestone[expences]"

      assert_select "input#project_milestone_Project_id[name=?]", "project_milestone[Project_id]"
    end
  end
end
