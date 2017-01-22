class RelationshipsController < ApplicationController  
  def follow_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.follow @user.id
      Notification.find_or_initialize_by(recipient: @user,actor: current_user,action: 'followed',notifiable: current_user).update_attributes!(read_at: nil)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_user
    @user = User.find_by! user_name: params[:user_name]
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end  