class PagesController < ApplicationController

  def home
    @posts = Post.all
    @fields = Post.column_names
  end


end
