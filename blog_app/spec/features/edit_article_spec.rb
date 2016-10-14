require 'rails_helper'
RSpec.feature "Editing an Article" do
    before do
        john = User.create(email: "john@example.com", password: "password")
        login_as(john)
        @article = Article.create(title:"First Article" , body:"Body of first Article", user: john)
    end
    
    scenario "User is able to update article" do
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: "Updated Article"
        fill_in "Body", with: "Updated body of article"
        
        click_button "Update Article"
        
        expect(page).to have_content("Article has been updated")
        expect(page.current_path).to eq(article_path(@article))
    end
    
    
    scenario "User fails to update article" do
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: "Updated body of article"
        
        click_button "Update Article"
        
        expect(page).to have_content("Article has not been updated")
        expect(page.current_path).to eq(article_path(@article))
    end
    
    
end