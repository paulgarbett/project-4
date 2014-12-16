class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    # brings in first id
    @post = Post.where(id: params[:id]).first
  end

  def create
    # Find our parent decision that we should attach to
    @post = current_user.posts.new(post_params)
    # Attach this criterion to a decision
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    # brings in first id for us to edit
    @post = Post.where(id: params[:id]).first
  end

  def update
  end

  def index
    @posts = Post.all
  end

  def destroy
  end

  def post_params
    params.require(:post).permit(:image, :title, :description)
  end

end