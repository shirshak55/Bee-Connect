# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_votable

  belongs_to :postable, polymorphic: true
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :user_id, presence: true
  validates :content, presence: true, unless: ->(user) { user.attachment.present? }
  validates :attachment, presence: true, unless: ->(user) { user.content.present? }
  validates :content, length: { maximum: 5000 }

  scope :of_followed_users, ->(following_users) { where user_id: following_users }

  def pdf?
    attachment.instance.attachment_content_type =~ /pdf/
  end

  def image?
    attachment.instance.attachment_content_type =~ /image/
  end
end
