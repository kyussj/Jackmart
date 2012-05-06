class JackmartController < ApplicationController
  def home
    if signed_in?
   @post = current_user.posts.build if signed_in?
   @feed_items = current_user.feed.paginate(page: params[:page])
	end
  end

  def help
  end

  def contact
  end
end
