require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :name => "Name",
        :project_id => 1,
        :branch_id => 2,
        :budget => "9.99",
        :description => "MyText",
        :repeated => 3
      ),
      Activity.create!(
        :name => "Name",
        :project_id => 1,
        :branch_id => 2,
        :budget => "9.99",
        :description => "MyText",
        :repeated => 3
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
