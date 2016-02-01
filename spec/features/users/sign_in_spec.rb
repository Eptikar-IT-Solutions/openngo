require "spec_helper"
require "rails_helper"

feature 'Sign in', :devise do

    it "allows users to sign in after they have registered" do
      role = Role.create(name:'Admin', permissions: {:all=>true})
      user = User.create(email: "test@example.com", password: "password123", confirmed_at: Time.now, role_id: role.id)

      visit "/login"

      fill_in "Email", with: "test@example.com"
      fill_in "Password", with: "password123"

      click_button "Login"

      page.should have_content("Signed in successfully.")
  end

end