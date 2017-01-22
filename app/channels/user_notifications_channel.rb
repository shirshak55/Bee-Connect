class UserNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_notifications_#{current_user.id}_channel"
  end
end