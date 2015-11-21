require 'rails_helper'

RSpec.describe "project_donors/edit", type: :view do
  before(:each) do
    @project_donor = assign(:project_donor, ProjectDonor.create!(
      :project_id => 1,
      :donor_id => 1
    ))
  end

  it "renders the edit project_donor form" do
    render

    assert_select "form[action=?][method=?]", project_donor_path(@project_donor), "post" do

      assert_select "input#project_donor_project_id[name=?]", "project_donor[project_id]"

      assert_select "input#project_donor_donor_id[name=?]", "project_donor[donor_id]"
    end
  end
end
