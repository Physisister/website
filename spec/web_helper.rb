def add_article
  visit "/articles"
  click_link "New article"
  fill_in "article[title]", with: "Example title"
  fill_in "article[text]", with: "Example text"
  click_button "Save Article"
end

def edit_article
  click_link "Edit"
  fill_in "article[title]", with: "Changed title"
  fill_in "article[text]", with: "Changed text"
  click_button "Update Article"
end
