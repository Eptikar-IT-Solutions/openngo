require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :name => "MyString",
      :project_id => 1,
      :branch_id => 1,
      :budget => "9.99",
      :description => "MyText",
      :repeated => 1
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input#activity_name[name=?]", "activity[name]"

      assert_select "input#activity_project_id[name=?]", "activity[project_id]"

      assert_select "input#activity_branch_id[name=?]", "activity[branch_id]"

      assert_select "input#activity_budget[name=?]", "activity[budget]"

      assert_select "textarea#activity_description[name=?]", "activity[description]"

      assert_select "input#activity_repeated[name=?]", "activity[repeated]"
    end
  end
end
