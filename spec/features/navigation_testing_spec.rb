require 'rails_helper'

RSpec.feature "Navigation", type: :feature do
  before(:each) do
    sign_up
  end
  scenario "Can visit the Blog from the homepage" do
    visit "/"
    click_link "Blog"
    expect(page).to have_current_path("/articles")
  end
  scenario "Can visit Home from the blog page" do
    visit "/articles"
    click_link "Home"
    expect(page).to have_current_path("/home/index")
  end
  scenario "Can click on an article to show it" do
    add_article
    click_link "Back"
    click_link "Example title"
    expect(page).to have_content("Example title")
    expect(page).to have_content("Example text")
    expect(page).to have_content "Back"
    expect(page).to have_content "Edit"
  end
  scenario "Can click on the edit button from the index page" do
    add_article
    click_link "Back"
    click_link "Edit"
    expect(page).to have_content("Edit")
  end
end
