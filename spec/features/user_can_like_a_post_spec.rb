require 'rails_helper'

RSpec.feature "Liking an article", type: :feature do
  scenario "Can see 0 Likes on the show page" do
    sign_up
    add_article
    click_link "Back"
    expect(page).to have_content("0 Likes")
  end
  scenario "Can like and see 1 like" do
    sign_up
    add_article
    click_button "Like"
    expect(page).to have_content("1 Like")
  end
  scenario "Can like and see 1 like on the index page" do
    sign_up
    add_article
    click_button "Like"
    click_link "Back"
    expect(page).to have_content("1 Like")
  end
  scenario "Can unlike and see 0 likes" do
    sign_up
    add_article
    click_button "Like"
    click_button "Unlike"
    expect(page).to have_content("0 Likes")
  end
  scenario "Can unlike and see 0 likes on the index page" do
    sign_up
    add_article
    click_button "Like"
    click_button "Unlike"
    click_link "Back"
    expect(page).to have_content("0 Likes")
  end
end
