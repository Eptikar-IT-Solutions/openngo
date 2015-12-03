require 'rails_helper'

RSpec.describe "project_roles/index", type: :view do
  before(:each) do
    assign(:project_roles, [
      ProjectRole.create!(
        :role_id => 1,
        :project_id => 2,
        :description => "MyText"
      ),
      ProjectRole.create!(
        :role_id => 1,
        :project_id => 2,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of project_roles" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
