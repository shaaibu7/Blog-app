class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, class_name: 'Post', counter_cache: :comments_counter

  def update_comment_counter
    post.increment!(:comments_counter)
  end
end
