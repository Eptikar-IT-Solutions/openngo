require 'rails_helper'

RSpec.describe "project_donors/new", type: :view do
  before(:each) do
    assign(:project_donor, ProjectDonor.new(
      :project_id => 1,
      :donor_id => 1
    ))
  end

  it "renders new project_donor form" do
    render

    assert_select "form[action=?][method=?]", project_donors_path, "post" do

      assert_select "input#project_donor_project_id[name=?]", "project_donor[project_id]"

      assert_select "input#project_donor_donor_id[name=?]", "project_donor[donor_id]"
    end
  end
end
