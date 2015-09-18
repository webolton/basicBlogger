class HomeController < ApplicationController
  
  def index
  	if !session[:user_id].nil?
      flash.notice = current_user.user_name + t(:logged_in_flash)
      # " is logged in."
    end

    @mainFeed = Post.all
    @feed = @mainFeed.order(id: :desc)
    @posts_desecending = Post.where(parent: nil).order(id: :desc)
  end
end
