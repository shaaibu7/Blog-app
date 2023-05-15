class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  def five_recent_post
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
