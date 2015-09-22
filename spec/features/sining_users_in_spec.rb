require 'rails_helper'

RSpec.feature "user sign in" do
  before do
    @jhon = User.create!(email: "jhon@example.com", password: "password")
  end
  
  scenario "with valid credentials" do
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @jhon.email
    fill_in "Password", with: @jhon.password
    click_button "Log in"
    
    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@jhon.email}")
  end
end
    