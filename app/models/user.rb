class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def three_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end

 user = User.new(name: 'John', photo: 'www.eample.com', bio: 'Life science', posts_counter: 0)