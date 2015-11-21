require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :budget => "9.99",
      :goal => "MyText",
      :description => "MyText"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_budget[name=?]", "project[budget]"

      assert_select "textarea#project_goal[name=?]", "project[goal]"

      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
