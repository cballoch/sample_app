class UsersController < ApplicationController
#  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @title = @user.name
  end
  
  def new
    if !signed_in?
      @title = "Sign up"
      @user = User.new
    else
      redirect_to(root_path)
    end   
  end

  def create
    if !signed_in?
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        @title = "Sign up"
        @user.password = nil
        @user.password_confirmation = nil
        render 'new'
      end
    else
      redirect_to(root_path)
    end
    
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def destroy
    @user = User.find(params[:id])
    if current_user != @user
      @user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    else
      flash[:error] = "You are the admin, you cannot destroy yourself!"
      redirect_to users_path 
    end      
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  private
  
#    def authenticate
#      deny_access unless signed_in?
#    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      if signed_in?
        redirect_to(root_path) unless current_user.admin?
      else
        redirect_to(signin_path)
      end
    end
end
 