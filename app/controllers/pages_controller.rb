class PagesController < ApplicationController
  def landing
    @init_user = InitUser.new
  end
  
  def home
    @title = "Home"
    @init_user = InitUser.new
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end 
  
  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end

end
