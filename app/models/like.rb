class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter(post_id)
    post = Post.find_by(id: post_id)
    post.likes_counter = post.likes.count
    post.save
  end
end
