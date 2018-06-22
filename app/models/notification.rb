# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  after_commit do
    UserNotificationsBroadcastJob.perform_later(self)
  end

  scope :unread, -> { where(read_at: nil) }
  scope :recent, -> { order(updated_at: :desc).limit(10) }
end
