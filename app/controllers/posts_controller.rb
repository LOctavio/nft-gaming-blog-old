class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @post = @user.posts.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: 'You have successfully created a post'
    else
      redirect_to new_post_path, notice: 'This is an invalid post'
    end
  end

  private

  def post_params
    params.permit(:title, :text, :comments_counter, :likes_counter)
  end
end
