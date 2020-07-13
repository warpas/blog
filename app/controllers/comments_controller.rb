class CommentsController < ApplicationController
  def index
    @post = Post.find(comment_params[:post_id])
  end

  private

  def comment_params
    params.permit(:post_id)
  end
end
