# require 'rails_helper'
#
# RSpec.feature "Deleting a reply", type: :feature do
#   before(:each) do
#     sign_up
#     add_article
#     add_comment
#     add_reply
#     within(find("div#reply_0")) do
#       click_link "Delete"
#     end
#   end
#   scenario "Can delete a reply" do
#     expect(page).not_to have_content("Example reply")
#   end
# end
