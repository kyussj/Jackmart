class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Entry created!"
      redirect_to root_path
    else
	  @feed_items = []
      render '/home'
    end
  end

  def destroy
    @post.destroy
    redirect_back_or root_path
  end

    private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end