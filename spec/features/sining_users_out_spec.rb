require "rails_helper"
RSpec.feature "signing signed-in users out" do
  before do
    @jhon = User.create!(email: "jhon@example.com", password: "password")
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @jhon.email
    fill_in "Password", with: @jhon.password
    click_button "Sign in"
  end
  
  scenario "log out" do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end
