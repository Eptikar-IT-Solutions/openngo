require 'rails_helper'

RSpec.describe "project_roles/show", type: :view do
  before(:each) do
    @project_role = assign(:project_role, ProjectRole.create!(
      :role_id => 1,
      :project_id => 2,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
