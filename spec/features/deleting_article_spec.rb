require 'rails_helper'

RSpec.feature "Deleting an article" do
  before do
    john = User.create(email:"john@example.com",password:"password")
    login_as(john)
    @article = Article.create(title: "first article", body: "body of first article", user: john)
  end
  
  scenario "A user delets an article" do
    visit "/"
    
    click_link @article.title
    click_link "Delete Article"
    
    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end


