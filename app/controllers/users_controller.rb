class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy, :following, :followers]
	before_filter :correct_user,   only: [:edit, :update]
	before_filter :admin_user,     only: :destroy
	
  def show
    @user = User.find(params[:id])
	@posts = @user.posts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(params[:user])
#	respond_to do |format|
    if @user.save
	  #UserMailer.welcome_email(@user).deliver
      sign_in @user
	  redirect_to @user
   #   format.html { redirect_to(@user, :notice => 'Welcome to the Jackmart app!') }
    else
      render 'new'
    end
  end
 # end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end
  
    def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
    def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
    private
	
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
