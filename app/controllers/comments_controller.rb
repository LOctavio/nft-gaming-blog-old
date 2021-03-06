class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:alert] = 'You have successfully created a comment'
      redirect_to action: 'show', controller: 'posts', user_id: params[:user_id], id: params[:post_id]
    else
      render :new, notice: 'This is an invalid comment'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    flash[:alert] = if @comment.destroy
                      'You have successfully deleted the comment'
                    else
                      'This comment was not deleted'
                    end
    redirect_to user_post_path(@post)
  end

  private

  def comment_params
    params.permit(:text, :post_id)
  end
end
