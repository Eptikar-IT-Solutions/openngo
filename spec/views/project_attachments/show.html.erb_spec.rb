require 'rails_helper'

RSpec.describe "project_attachments/show", type: :view do
  before(:each) do
    @project_attachment = assign(:project_attachment, ProjectAttachment.create!(
      :attachment_id => 1,
      :project_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
