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
    post = Post.find(params[:id])
    if post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.find(:all, :order => "created_at") 
  end

  def comment
   Post.find(params[:id]).comments.create(params[:comment])
   flash[:notice] = "Added your comment"
   redirect_to :action => "show", :id => params[:id]
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:image, :title, :description)
  end

end
