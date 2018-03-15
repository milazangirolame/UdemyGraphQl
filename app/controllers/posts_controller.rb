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

  def date_pub
    Post.find_by(params[:id]).created_at.to_date
  end

  def post_params
    params.require(:post).permit(:name, :body, :user_id)
  end



end
