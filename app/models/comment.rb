class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :article
  belongs_to :user
  has_many :replies, dependent: :destroy
end
