require 'rails_helper'

RSpec.describe "project_members/show", type: :view do
  before(:each) do
    @project_member = assign(:project_member, ProjectMember.create!(
      :project_id => 1,
      :member_id => 2,
      :role_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
