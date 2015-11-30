require 'rails_helper'

RSpec.describe "attachments/new", type: :view do
  before(:each) do
    assign(:attachment, Attachment.new(
      :name => "MyString"
    ))
  end

  it "renders new attachment form" do
    render

    assert_select "form[action=?][method=?]", attachments_path, "post" do

      assert_select "input#attachment_name[name=?]", "attachment[name]"
    end
  end
end
