class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = Post.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    if @post.save
      redirect_to current_user.posts
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def update
   @post = Post.find(params[:id])
     if @post.update(post_params)
      redirect_to current_user.posts
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to current_user.posts
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :user_id)
  end



end
