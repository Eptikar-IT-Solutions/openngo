require 'rails_helper'

RSpec.describe "project_partners/show", type: :view do
  before(:each) do
    @project_partner = assign(:project_partner, ProjectPartner.create!(
      :project_id => 1,
      :partner_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
