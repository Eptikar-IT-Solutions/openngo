require 'rails_helper'

RSpec.describe "project_partners/index", type: :view do
  before(:each) do
    assign(:project_partners, [
      ProjectPartner.create!(
        :project_id => 1,
        :partner_id => 2
      ),
      ProjectPartner.create!(
        :project_id => 1,
        :partner_id => 2
      )
    ])
  end

  it "renders a list of project_partners" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
