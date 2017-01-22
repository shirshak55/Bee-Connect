class UniversitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_university, only: [:show, :edit, :update, :destroy,:members]
  before_action :administration_right, only: [:create,:update,:destroy,:demote_moderator,:make_moderator]
  before_action :set_university_id_and_user_id_and_user, only: [:moderation_right,:delete,:approve,:ban,:make_moderator,:demote_moderator]
  before_action :moderation_right, only: [:delete,:approve,:ban,]

  def index
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def edit
  end

  def create
    @university = University.new(university_params)
    if @university.save
      redirect_to @university, notice: 'University was successfully created.'
    else
       render :new
    end
  end

  def update
    if @university.update(university_params)
       redirect_to @university, notice: 'University was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @university.destroy
    redirect_to universities_url, notice: 'University was successfully deleted.'
  end

  def show
    @posts = @university.posts.order('created_at DESC').page params[:page]
    @post = @university.posts.build
  end

  def chat
    @university = University.includes(:university_message).find_by(id: params[:id])
    @university_message = UniversityMessage.new
  end

  def members
    @members = UniversityMembership.includes(:university,:user).where(university_id: @university.id)
    @moderator_role_id = Role.where(name: 'moderator').first.id
    @approved_role_id = Role.where(name: 'group_approved').first.id
    @pending_role_id = Role.where(name: 'group_pending_approval').first.id
    @banned_role_id = Role.where(name: 'banned').first.id
  end

  def join
    @university_id = params[:id]
    @user_id = current_user.id
    if current_user.join_university_toggle @university_id
      render_js
    end
  end
  def unjoin
    @university_id = params[:id]
    @user_id = current_user.id
    if current_user.join_university_toggle @university_id
      render_js
    end
  end
  def delete
    @user = User.find(@user_id)
    if @user.delete_university_user @university_id
      render_js
    end
  end
  def approve
    if can_change_responsibility(@university_id,@user)
      role_update("group_approved")
      Notification.find_or_initialize_by(recipient: @user,actor: current_user,action: 'approved',notifiable: @university).update_attributes!(read_at: nil)
    end
  end
  def make_moderator
    if can_change_responsibility(@university_id,@user)
      role_update("moderator")
      Notification.find_or_initialize_by(recipient: @user,actor: current_user,action: 'promoted',notifiable: @university).update_attributes!(read_at: nil)
    end
  end
  def demote_moderator
    if can_change_responsibility(@university_id,@user)
      role_update("group_approved")
    end
  end
  def ban
    if can_change_responsibility(@university_id,@user)
      role_update("banned")
    end
  end

  private
    def university_params
      params.require(:university).permit(:name,:thumbnail_image,:timeline_image, :description)
    end
    def set_university
      @university = University.find(params[:id])
    end
    def set_university_id_and_user_id_and_user
      @university_id = params[:id]
      @university = University.find(@university_id)
      @user_id = params[:user_id]
      @user = User.find(@user_id)
    end

    def administration_right
      unless current_user.role.name =='admin'
        redirect_for_invalid_activity
      end
    end
    def moderation_right
      unless is_responsible_user(@university_id,current_user)
        redirect_for_invalid_activity
      end
    end
    def is_responsible_user(university_id,user)
      user.university_role_name(university_id) == 'moderator' or current_user.role.name =='admin'
    end
    def can_change_responsibility(university_id,user)
      !is_responsible_user(university_id,user) or current_user.role.name =='admin'
    end
    def redirect_for_invalid_activity
      flash[:alert] = "Only responsible person can accomplish such responsibility!"
      redirect_to universities_path
    end
    def role_update(role_name)
      if @user.university_role_update @university_id , role_name
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
