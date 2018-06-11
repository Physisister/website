require 'rails_helper'

RSpec.feature "Deleting an article", type: :feature do
  before(:each) do
    sign_up
    add_article
    click_link "Back"
    click_link "Delete"
  end
  scenario "Can delete an article" do
    expect(page).not_to have_content("Example title")
    expect(page).not_to have_content("Example text")
    expect(page).to have_current_path("/articles")
  end
end
