class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_postable
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like,:unlike]
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :group_approval, only: [:create,:edit, :update, :destroy,:like ,:unlike]

  def create
    @posts = Post.of_followed_users(current_user.following).order('created_at DESC').page params[:page]
    @post = @postable.posts.build(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "The given post has been created!"
      if(@post.postable_type == 'User')
        redirect_to root_path
      else
        redirect_to @postable
      end
    else
      flash[:alert] = "The given new post couldn't be created!  Please check the form."
      redirect_to  [@postable]
    end
  end
  def show
  end
  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      if(@post.postable_type == 'User')
        redirect_to profile_path(current_user.user_name)
      else
        redirect_to @postable
      end
    else
      flash[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "The given post has been deleted."
    redirect_to profile_path(current_user.user_name)
  end

  def like
    if @post.liked_by current_user
      if @post.user.id != current_user.id
        Notification.create(recipient: @post.user,actor: current_user,action: 'liked',notifiable: @post)
      end
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end
  def unlike
    if @post.unliked_by current_user
      respond_to do |format|
        format.js
        format.html { redirect_to :back }
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:attachment, :content)
  end

  def set_post
    @post = @postable.posts.find(params[:id])
  end

  def load_postable
    @klass = [User,Group].detect{|c| params["#{c.name.underscore}_id"]}
    @postable = @klass.find(params["#{@klass.name.underscore}_id"]);
  end

  def owned_post
    if(@klass.name == 'Group')
      unless current_user == @post.user || current_user.role.name =='admin' || (current_user.is_univerisity_moderator(@post.postable.id) && !@post.user.is_univerisity_moderator(@post.postable.id))
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    else
      unless current_user == @post.user || current_user.role.name =='admin'
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end
  end
  def group_approval
    if(@klass.name == 'Group')
      unless current_user.is_group_approved(@postable.id)
        flash[:alert] = "You are not eligible to post without approvals!"
        redirect_to root_path
      end
    end
  end
end
