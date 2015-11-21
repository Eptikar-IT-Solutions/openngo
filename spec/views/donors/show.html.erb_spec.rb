require 'rails_helper'

RSpec.describe "donors/show", type: :view do
  before(:each) do
    @donor = assign(:donor, Donor.create!(
      :name => "Name",
      :email => "Email",
      :phone1 => "Phone1",
      :phone2 => "Phone2",
      :fax => "Fax",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone1/)
    expect(rendered).to match(/Phone2/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/MyText/)
  end
end
