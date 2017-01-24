class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.where(postable_type: 'User').of_followed_users(current_user.following).order('created_at DESC').page params[:page]
    @post = current_user.posts.build
  end
  def search
    if(!params[:username])
      flash[:danger] = "No search as given"
      redirect_to root_path
    end
    @result = User.search_name(params[:username].downcase);
    puts "__________________________________________________________________"
    puts params[:username]
    puts @result
  end
end