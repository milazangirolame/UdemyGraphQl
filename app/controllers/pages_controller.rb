class PagesController < ApplicationController

  def home
    @posts = Post.all
    @fields = Post.column_names


  end

  private

  def field_name(field)
    field_name = Post.columns_hash['field'].name

    def method(field)
          return post.field_name

      end

    end


end
