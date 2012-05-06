class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update]
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
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
	respond_to do |format|
    if @user.save
	  UserMailer.welcome_email(@user).deliver
      sign_in @user
      format.html { redirect_to(@user, :notice => 'Welcome to the Jackmart app!') }
    else
      render 'new'
    end
  end
  end
  
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
  
    private
	
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
	
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
