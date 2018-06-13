class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def timesort_comments
    self.comments.sort_by { |comment| comment.created_at }
  end

  def self.timesort_articles
    self.all.sort_by { |post| post.created_at }.reverse
  end
end
