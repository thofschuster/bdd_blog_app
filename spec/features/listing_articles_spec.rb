require 'rails_helper'

RSpec.feature "Listing articles" do
  
  before do
    @article1 = Article.create(title: "first article", body: "body of first article")
    @article2 = Article.create(title: "second article", body: "body of second article")
    @article3 = Article.create(title: "third article", body: "body of third article")
  end
  
  scenario "list all articles" do
    visit "/"
    
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_content(@article3.title)
    expect(page).to have_content(@article3.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
    expect(page).to have_link(@article3.title)  
    expect(page).not_to have_link("New Article")
  end
end