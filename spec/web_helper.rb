def create_user
  user = User.create(email: "example@example.com", username: "example_username", password: "examplepassword", write_access: "1")
end

def sign_up
  visit "/users/sign_up"
  fill_in "user[username]", with: "example_username2"
  fill_in "user[email]", with: "example2@example.com"
  fill_in "user[password]", with: "example2password"
  fill_in "user[password_confirmation]", with: "example2password"
  click_button "Sign up"
end

def sign_in
  visit "/users/sign_in"
  fill_in "user[email]", with: "example@example.com"
  fill_in "user[password]", with: "examplepassword"
  click_button "Log in"
end

def add_article
  click_link "Blog"
  click_button "New article"
  fill_in "article[title]", with: "Example title"
  fill_in "article[text]", with: "Example text"
  click_button "Save Article"
end

def edit_article
  click_button "Edit"
  fill_in "article[title]", with: "Changed title"
  fill_in "article[text]", with: "Changed text"
  click_button "Update Article"
end

def add_comment
  fill_in "comment[content]", with: "Example comment"
  click_button "New Comment"
end

def add_reply
  find('.reply-link', :text => 'Reply').click
  fill_in "reply[content]", with: "Example reply"
  click_button "New Reply"
end
