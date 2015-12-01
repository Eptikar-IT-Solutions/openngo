require 'rails_helper'

RSpec.describe "project_milestones/index", type: :view do
  before(:each) do
    assign(:project_milestones, [
      ProjectMilestone.create!(
        :name => "Name",
        :description => "MyText",
        :expences => "9.99",
        :project_id => 1
      ),
      ProjectMilestone.create!(
        :name => "Name",
        :description => "MyText",
        :expences => "9.99",
        :project_id => 1
      )
    ])
  end

  it "renders a list of project_milestones" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
