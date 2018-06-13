require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "#timesort_comments" do
    it "returns a sorted array of comments" do
      article = Article.create(title: "test", text: "test" user_id: 1)
      post.comments.create(content: "test", post_id: 1, user_id: 1)
      post.comments.create(content: "test2", post_id: 1, user_id: 1)
      expect(article.timesort_comments[0].content).to eq "test"
    end
  end
  describe "#timesort_articles" do
    it "returns a sorted array of articles" do
      article = Article.create(title: "test", text: "test" user_id: 1)
      article = Article.create(title: "test2", text: "test2" user_id: 1)
      expect(article.timesort_comments[0].content).to eq "test"
    end
  end
end
