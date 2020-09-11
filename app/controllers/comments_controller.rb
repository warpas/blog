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
    @comment = Comment.new
  end

  def create
    @post = Post.find(comment_params[:post_id])
    @comment = Comment.new
    @comment.post_id = @post.id
    @comment.commenter_name = "Example Commenter"
    @comment.content = "An eloquent retort."
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
end
