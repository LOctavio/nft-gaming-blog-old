class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to :action=>"show", :controller=>"posts", :user_id => params[:user_id], :id => params[:post_id]
    else
      render :new
    end
  end

  private

  def comment_params
    params.permit(:text, :author_id, :post_id)
  end
end
