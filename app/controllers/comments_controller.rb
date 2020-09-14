class CommentsController < ApplicationController
  def index
    @post = Post.find(comment_params[:post_id])
  end

  def show
    @post = Post.find(comment_params[:post_id])
    @comment = Comment.find(comment_params[:id])
  end

  def new
    @post = Post.find(comment_params[:post_id])
  end

  def create
    @post = Post.find(comment_params[:post_id])
    @comment = Comment.new
    @comment.post_id = @post.id
    @comment.commenter_name = comment_details[:commenter_name]
    @comment.commenter_url = comment_details[:commenter_url]
    @comment.content = comment_details[:content]
    if @comment.save
      redirect_to @post
    else
      puts "error = #{@comment.valid?}"
      render "new"
    end
  end

  private

  def comment_params
    params.permit(:id, :post_id, :authenticity_token, :commit)
  end

  def comment_details
    params.require(:comment).permit(:commenter_name, :commenter_url, :content)
  end
end
