class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  def create
    user = User.authenticate("caleb.balloch@rechaoss.com",params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      redirect_to root_path
    else
      sign_in user
      redirect_to video_path
    end
  end
  

  

end
