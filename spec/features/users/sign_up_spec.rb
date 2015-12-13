require "spec_helper"
require "rails_helper"

describe "user registration" do
  it "allows new users to register with an email address and password" do
    visit('/sign_up')
    fill_in "Email",                 :with => "alias@example.com"
    fill_in "Password",              :with => "password"
    fill_in "Password Confirmation", :with => "password"
    
    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
  end
end
