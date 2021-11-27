class LikesController < ApplicationController
  before_action :find_post

  def create
    @like = Like.new(author_id: current_user.id, post_id: params[:post_id])
    flash[:alert] = if @like.save
                      'You have successfully liked this post'
                    else
                      'This is an invalid like'
                    end
    redirect_to user_post_path(User.find(params[:user_id]), @post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
