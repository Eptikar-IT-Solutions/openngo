require 'rails_helper'

RSpec.describe "lines/show", type: :view do
  before(:each) do
    @line = assign(:line, Line.create!(
      :name => "Name",
      :quantity => 1,
      :cost => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
  end
end
