require 'rails_helper'

RSpec.describe "attachments/index", type: :view do
  before(:each) do
    assign(:attachments, [
      Attachment.create!(
        :name => "Name"
      ),
      Attachment.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of attachments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
