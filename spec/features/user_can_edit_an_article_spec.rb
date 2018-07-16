require 'rails_helper'

RSpec.feature "Editing an article", type: :feature do
  before(:each) do
    create_user
    sign_in
    add_article
  end
  scenario "Can see the edited article on the show page" do
    edit_article
    expect(page).to have_content("Changed title")
    expect(page).to have_content("Changed text")
  end

  scenario "Can see the edited article on the index page" do
    edit_article
    click_button "Back"
    expect(page).to have_content("Changed title")
    expect(page).to have_content("Changed text")
  end

  scenario "Will not let you submit an article without a title" do
    click_button "Edit"
    fill_in "article[title]", with: ""
    fill_in "article[text]", with: "Changed text"
    click_button "Update Article"
    visit '/articles'
    expect(page).not_to have_content "Changed text"
  end

  scenario "Will not let you submit an article without text" do
    click_button "Edit"
    fill_in "article[title]", with: "Changed title"
    fill_in "article[text]", with: ""
    click_button "Update Article"
    visit '/articles'
    expect(page).not_to have_content "Changed title"
  end
end
