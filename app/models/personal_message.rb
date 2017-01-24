class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  after_create_commit do
    conversation.touch
    ConversationJob.perform_later(self)
  end
end
