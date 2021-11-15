class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter(post_id)
    post = Post.find_by(id: post_id)
    post.comments_counter = post.comments.count
    post.save
  end
end
