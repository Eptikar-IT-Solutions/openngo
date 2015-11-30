require 'rails_helper'

RSpec.describe "attachments/edit", type: :view do
  before(:each) do
    @attachment = assign(:attachment, Attachment.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit attachment form" do
    render

    assert_select "form[action=?][method=?]", attachment_path(@attachment), "post" do

      assert_select "input#attachment_name[name=?]", "attachment[name]"
    end
  end
end
