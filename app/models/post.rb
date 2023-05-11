class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def five_recent_post
    comments.order(created_at: :desc).limit(5)
  end

  
end