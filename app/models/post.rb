class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:post_counter)
  end

  def decrement_posts_counter
    author.decrement!(:post_counter)
  end
end
