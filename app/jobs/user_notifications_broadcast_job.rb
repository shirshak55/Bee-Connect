class UserNotificationsBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast "user_notifications_#{notification.recipient_id}_channel",notify: true
    #ActionCable.server.broadcast "user_notifications_#{notification.recipient_id}_channel",notification_type:notification.notifiable_type.underscore.pluralize,template: render_notifications(notification)
  end

  private
  def render_notifications(notification)
    NotificationsController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}
  end
end