class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:alert] = "You have successfully created a comment"
      redirect_to action: 'show', controller: 'posts', user_id: params[:user_id], id: params[:post_id]
    else
      render :new, notice: "This is an invalid comment"
    end
  end

  private

  def comment_params
    params.permit(:text, :author_id, :post_id)
  end
end
