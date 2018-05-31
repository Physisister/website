require 'rails_helper'

RSpec.feature "Editing an article", type: :feature do
  scenario "Can see the edited article on the show page" do
    sign_up
    add_article
    edit_article
    expect(page).to have_content("Changed title")
    expect(page).to have_content("Changed text")
    expect(page).to have_content "Back"
    expect(page).to have_content "Edit"
  end

  scenario "Can see the edited article on the index page" do
    sign_up
    add_article
    edit_article
    click_link "Back"
    expect(page).to have_content("Changed title")
    expect(page).to have_content("Changed text")
  end

  scenario "Can click on the edit button from the index page" do
    sign_up
    add_article
    edit_article
    click_link "Back"
    click_button "Edit"
    expect(page).to have_content("Edit")
  end

  scenario "Will not let you submit an article without a title" do
    sign_up
    add_article
    click_link "Edit"
    fill_in "article[title]", with: ""
    fill_in "article[text]", with: "Changed text"
    click_button "Update Article"
    expect(page).to have_content("Every blog needs a title and some text")
  end

  scenario "Will not let you submit an article without text" do
    sign_up
    add_article
    click_link "Edit"
    fill_in "article[title]", with: "Changed title"
    fill_in "article[text]", with: ""
    click_button "Update Article"
    expect(page).to have_content("Every blog needs a title and some text")
  end
end
