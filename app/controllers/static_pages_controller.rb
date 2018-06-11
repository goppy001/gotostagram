class StaticPagesController < ApplicationController
  include MicropostsHelper

  def post
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
      @comment = Comment.new
      @comments = @micropost.comments
     else
      redirect_to login_url
    end
  end

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
      @comment = Comment.new
    else
      redirect_to login_url
    end
  end

  def help
  end
end
