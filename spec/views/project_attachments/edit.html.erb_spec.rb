require 'rails_helper'

RSpec.describe "project_attachments/edit", type: :view do
  before(:each) do
    @project_attachment = assign(:project_attachment, ProjectAttachment.create!(
      :attachment_id => 1,
      :project_id => 1
    ))
  end

  it "renders the edit project_attachment form" do
    render

    assert_select "form[action=?][method=?]", project_attachment_path(@project_attachment), "post" do

      assert_select "input#project_attachment_attachment_id[name=?]", "project_attachment[attachment_id]"

      assert_select "input#project_attachment_project_id[name=?]", "project_attachment[project_id]"
    end
  end
end
