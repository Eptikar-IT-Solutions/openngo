require 'rails_helper'

RSpec.describe "project_partners/edit", type: :view do
  before(:each) do
    @project_partner = assign(:project_partner, ProjectPartner.create!(
      :project_id => 1,
      :partner_id => 1
    ))
  end

  it "renders the edit project_partner form" do
    render

    assert_select "form[action=?][method=?]", project_partner_path(@project_partner), "post" do

      assert_select "input#project_partner_project_id[name=?]", "project_partner[project_id]"

      assert_select "input#project_partner_partner_id[name=?]", "project_partner[partner_id]"
    end
  end
end
