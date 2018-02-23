class CommentsController < ApplicationController

  def index
    @comments = Comments.all
  end

  def show
    @post = Post.find(params[:id])
    @user = Comments.find(params[:user_id])
    @comment = Comment.find(params[:id])

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:id])
    @user = current_user
    if @comment.save
      redirect_to post.comments
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @user = current_user
  end

  def update
   @comment = Comment.find(params[:id])
     if @comment.update(comment_params)
      redirect_to current_user.comments
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to current_user.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body, :user_id)
  end
end
