require 'rails_helper'

RSpec.describe "project_milestones/show", type: :view do
  before(:each) do
    @project_milestone = assign(:project_milestone, ProjectMilestone.create!(
      :name => "Name",
      :description => "MyText",
      :expences => "9.99",
      :Project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
  end
end
