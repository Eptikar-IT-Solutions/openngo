require 'rails_helper'

RSpec.describe "project_donors/show", type: :view do
  before(:each) do
    @project_donor = assign(:project_donor, ProjectDonor.create!(
      :project_id => 1,
      :donor_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
