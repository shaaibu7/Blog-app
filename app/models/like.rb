class Like < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, foreign_key: :author_id, counter_cache: :likes_counter, class_name: 'Post'

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
