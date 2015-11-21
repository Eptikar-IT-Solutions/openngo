require 'rails_helper'

RSpec.describe "project_donors/index", type: :view do
  before(:each) do
    assign(:project_donors, [
      ProjectDonor.create!(
        :project_id => 1,
        :donor_id => 2
      ),
      ProjectDonor.create!(
        :project_id => 1,
        :donor_id => 2
      )
    ])
  end

  it "renders a list of project_donors" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
