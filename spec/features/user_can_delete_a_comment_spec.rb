require 'rails_helper'

RSpec.feature "Deleting a comment", type: :feature do
  before(:each) do
    create_user
    sign_in
    add_article
    add_comment
    within(find("div#comment_0")) do
      click_link "Delete"
    end
  end
  scenario "Can delete a comment" do
    expect(page).not_to have_content("Example comment")
  end
end
