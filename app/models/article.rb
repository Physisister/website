class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  def timesort_comments
    self.comments.sort_by { |comment| comment.created_at }
  end
end
