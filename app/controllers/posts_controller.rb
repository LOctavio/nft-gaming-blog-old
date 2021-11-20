class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(current_user), notice: "You have successfully created a post"
    else
      redirect_to new_post_path, notice: "This is an invalid post"
    end
  end

  private

  def post_params
    params.permit(:title, :text, :author_id)
  end
end
