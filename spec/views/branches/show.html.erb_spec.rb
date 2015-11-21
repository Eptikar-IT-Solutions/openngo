require 'rails_helper'

RSpec.describe "branches/show", type: :view do
  before(:each) do
    @branch = assign(:branch, Branch.create!(
      :name => "Name",
      :description => "MyText",
      :state => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
