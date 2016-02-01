require "rails_helper"
require 'spec_helper'

feature "Members" do

  before(:each) do
    FactoryGirl.create(:user)
    FactoryGirl.create :profession
    FactoryGirl.create(:profession, name: 'other')
  end

it {puts page.body}
  scenario "creating a new member with existing profession" do
    visit root_url
    fill_in "Email", with: "test@example.com"
    click_button "Login"

    visit new_member_url

    fill_in "mobile", with: "0910662240"
    fill_in "member[email]", with: "info@eptikar.com"
    
    select("Farmer", from: "member[profession_id]")
    click_button "Save"
    expect(page).to have_content("Member was successfully created.")
    
    arwa = Member.first

    expect(arwa.name).to eq 'Arwa Ahmed'
    expect(arwa.profession).to eq Profession.find_by(name: "Farmer")
  end

   scenario "creating a new member with new profession" do
    visit root_url
    fill_in "Email", with: "test@example.com"
    click_button "Login"

    visit new_member_url

    fill_in "member[email]", with: "info@eptikar.com"
    select('other', from: 'member[profession_id]')
    fill_in "member[other_profession]", with: "Doctor"
    click_button "Save"
    expect(page).to have_content('Member was successfully created.')
    arwa = Member.first
    expect(arwa.name).to eq 'Arwa Ahmed' 
    expect(arwa.profession).to eq Profession.find_by(name: "Doctor")
  end 
end