class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(post_params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = "Auto-created post"
    @post.content = "Not much there."
    if @post.save
      redirect_to @post
    else
      puts "error = #{@post.valid?}"
      render "new"
    end
  end

  private

  def post_params
    params.permit(:id)
  end
end
