class PostsController < ApplicationController
  before_action :authenticate_admin_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_url, notice: 'Post created'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tags, :status)
  end
end
