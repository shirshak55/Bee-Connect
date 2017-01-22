class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end
  def mark_notifications_as_read
    @notifications = Notification.where(recipient: current_user).where.not(notifiable_type: 'Conversation').unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
  def mark_messages_notification_as_read
    @notifications = Notification.where(recipient: current_user,notifiable_type: 'Conversation').where(notifiable_type: 'Conversation').unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
  def mark_all_as_read
    @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
