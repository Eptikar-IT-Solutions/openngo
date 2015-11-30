require 'rails_helper'

RSpec.describe "project_attachments/new", type: :view do
  before(:each) do
    assign(:project_attachment, ProjectAttachment.new(
      :attachment_id => 1,
      :project_id => 1
    ))
  end

  it "renders new project_attachment form" do
    render

    assert_select "form[action=?][method=?]", project_attachments_path, "post" do

      assert_select "input#project_attachment_attachment_id[name=?]", "project_attachment[attachment_id]"

      assert_select "input#project_attachment_project_id[name=?]", "project_attachment[project_id]"
    end
  end
end
