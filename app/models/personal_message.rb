# frozen_string_literal: true

class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :body, presence: true

  after_create_commit do
    conversation.touch
    ConversationJob.perform_later(self)
  end
end
