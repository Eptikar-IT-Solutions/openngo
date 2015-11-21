require 'rails_helper'

RSpec.describe "project_partners/new", type: :view do
  before(:each) do
    assign(:project_partner, ProjectPartner.new(
      :project_id => 1,
      :partner_id => 1
    ))
  end

  it "renders new project_partner form" do
    render

    assert_select "form[action=?][method=?]", project_partners_path, "post" do

      assert_select "input#project_partner_project_id[name=?]", "project_partner[project_id]"

      assert_select "input#project_partner_partner_id[name=?]", "project_partner[partner_id]"
    end
  end
end
