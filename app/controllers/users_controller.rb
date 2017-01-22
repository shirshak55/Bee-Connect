class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @posts = current_user.posts.order('created_at DESC').page params[:page]
    @post = current_user.posts.build
  end
end