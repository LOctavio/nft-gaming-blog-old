class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_posts_counter(user_id)
    user = User.find_by(id: user_id)
    user.post_counter = user.posts.count
    user.save
  end

  def most_recent_comments(post_id)
    Post.find_by(id: post_id).comments.order(created_at: :desc).limit(5)
  end
end
