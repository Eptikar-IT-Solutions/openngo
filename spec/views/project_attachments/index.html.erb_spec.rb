require 'rails_helper'

RSpec.describe "project_attachments/index", type: :view do
  before(:each) do
    assign(:project_attachments, [
      ProjectAttachment.create!(
        :attachment_id => 1,
        :project_id => 2
      ),
      ProjectAttachment.create!(
        :attachment_id => 1,
        :project_id => 2
      )
    ])
  end

  it "renders a list of project_attachments" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
