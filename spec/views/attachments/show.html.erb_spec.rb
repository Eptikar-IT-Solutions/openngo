require 'rails_helper'

RSpec.describe "attachments/show", type: :view do
  before(:each) do
    @attachment = assign(:attachment, Attachment.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
