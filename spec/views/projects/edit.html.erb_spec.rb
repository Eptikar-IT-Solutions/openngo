require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "MyString",
      :budget => "9.99",
      :goal => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_budget[name=?]", "project[budget]"

      assert_select "textarea#project_goal[name=?]", "project[goal]"

      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
