class InitUsersController < ApplicationController
  include InitUsersHelper
  def create
    @init_user = InitUser.find_or_create_by_email(params[:init_user][:email])
    if @init_user.save
      flash.now[:success]="Thanks for signing up. "
      @init_user = InitUser.new
    else
      render_errors(@init_user)
    end
    redirect_to root_path
  end
end
