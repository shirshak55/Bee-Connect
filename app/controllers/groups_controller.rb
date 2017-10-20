class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy,:members]
  before_action :administration_right, only: [:create,:update,:destroy,:demote_moderator,:make_moderator]
  before_action :set_group_id_and_user_id_and_user, only: [:moderation_right,:delete,:approve,:ban,:make_moderator,:demote_moderator]
  before_action :moderation_right, only: [:delete,:approve,:ban,]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
       render :new
    end
  end

  def update
    if @group.update(group_params)
       redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully deleted.'
  end

  def show
    @posts = @group.posts.order('created_at DESC').page params[:page]
    @post = @group.posts.build
  end

  def chat
    @group = Group.includes(:group_message).find_by(id: params[:id])
    @group_message = GroupMessage.new
  end

  def members
    @members = GroupMembership.includes(:group,:user).where(group_id: @group.id)
    @moderator_role_id = Role.where(name: 'moderator').first.id
    @approved_role_id = Role.where(name: 'group_approved').first.id
    @pending_role_id = Role.where(name: 'group_pending_approval').first.id
    @banned_role_id = Role.where(name: 'banned').first.id
  end

  def join
    @group_id = params[:id]
    @user_id = current_user.id
    if current_user.join_group_toggle @group_id
      render_js
    end
  end
  def unjoin
    @group_id = params[:id]
    @user_id = current_user.id
    if current_user.join_group_toggle @group_id
      render_js
    end
  end
  def delete
    @user = User.find(@user_id)
    if @user.delete_group_user @group_id
      render_js
    end
  end
  def approve
    if can_change_responsibility(@group_id,@user)
      role_update("group_approved")
      Notification.find_or_initialize_by(recipient: @user,actor: current_user,action: 'approved',notifiable: @group).update_attributes!(read_at: nil)
    end
  end
  def make_moderator
    if can_change_responsibility(@group_id,@user)
      role_update("moderator")
      Notification.find_or_initialize_by(recipient: @user,actor: current_user,action: 'promoted',notifiable: @group).update_attributes!(read_at: nil)
    end
  end
  def demote_moderator
    if can_change_responsibility(@group_id,@user)
      role_update("group_approved")
    end
  end
  def ban
    if can_change_responsibility(@group_id,@user)
      role_update("banned")
    end
  end

  private
    def group_params
      params.require(:group).permit(:name,:thumbnail_image,:timeline_image, :description)
    end
    def set_group
      @group = Group.find(params[:id])
    end
    def set_group_id_and_user_id_and_user
      @group_id = params[:id]
      @group = Group.find(@group_id)
      @user_id = params[:user_id]
      @user = User.find(@user_id)
    end

    def administration_right
      unless current_user.role.name =='admin'
        redirect_for_invalid_activity
      end
    end
    def moderation_right
      unless is_responsible_user(@group_id,current_user)
        redirect_for_invalid_activity
      end
    end
    def is_responsible_user(group_id,user)
      user.group_role_name(group_id) == 'moderator' or current_user.role.name =='admin'
    end
    def can_change_responsibility(group_id,user)
      !is_responsible_user(group_id,user) or current_user.role.name =='admin'
    end
    def redirect_for_invalid_activity
      flash[:alert] = "Only responsible person can accomplish such responsibility!"
      redirect_to groups_path
    end
    def role_update(role_name)
      if @user.group_role_update @group_id , role_name
        render_js
      else
        redirect_for_invalid_activity
      end
    end
    def render_js
      respond_to do |format|
        format.js
      end
    end
end
