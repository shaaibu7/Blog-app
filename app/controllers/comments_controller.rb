class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_posts_path
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
