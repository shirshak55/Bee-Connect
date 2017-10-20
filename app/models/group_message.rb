class GroupMessage < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { GroupMessageBroadcastJob.perform_later(self) }
end
