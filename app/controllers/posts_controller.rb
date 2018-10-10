class PostsController < ApplicationController
  before_action :authenticate_admin_user!, except: %i[index show]
  before_action :find_post, only: %i[show edit update]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      flash[:success] = 'Post created!'
      redirect_to @post, notice: 'Post created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = 'Post updated'
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :tags, :status, :header)
  end
end
