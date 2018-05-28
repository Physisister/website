require 'rails_helper'

RSpec.feature "Adding an article", type: :feature do
  scenario "Can see it on the show page" do
    add_article
    expect(page).to have_content("Example title")
    expect(page).to have_content("Example text")
    expect(page).to have_content "Back"
    expect(page).to have_content "Edit"
  end

  scenario "Can see it on the index page" do
    add_article
    click_link "Back"
    expect(page).to have_content("Example title")
    expect(page).to have_content("Example text")
  end

  scenario "Will not let you add an article without a title" do
    visit "/articles"
    click_link "New article"
    fill_in "article[text]", with: "Example text"
    click_button "Save Article"
    expect(page).to have_content("Every blog needs a title and some text")
  end

  scenario "Will not let you add an article without text" do
    visit "/articles"
    click_link "New article"
    fill_in "article[title]", with: "Example title"
    click_button "Save Article"
    expect(page).to have_content("Every blog needs a title and some text")
  end
end