class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :read, Post, author: user
    can :read, Comment, author: user
    return unless user.role == 'admin' # additional permissions for administrators

    can :read, Post
    can :read, Comment
  end
end
