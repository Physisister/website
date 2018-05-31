require 'rails_helper'

RSpec.feature "Deleting a comment", type: :feature do
  scenario "Can delete a comment" do
    sign_up
    add_article
    add_comment
    click_link "Delete"
    expect(page).not_to have_content("Example comment")
  end
end
