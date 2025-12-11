class CommentsController < ApplicationController
  def create
    @post = Post.find(params.expect(:post_id))
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to @post, notice: "댓글이 등록되었습니다."
    else
      @comments = @post.comments.order(created_at: :asc)
      flash.now[:alert] = "댓글을 저장할 수 없습니다."
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
