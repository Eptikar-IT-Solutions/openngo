require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
      :name => "Name",
      :website => "Website",
      :subdomain => "Subdomain",
      :email => "Email",
      :phone1 => "Phone1",
      :phone2 => "Phone2",
      :fax => "Fax",
      :address => "Address",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Subdomain/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone1/)
    expect(rendered).to match(/Phone2/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
