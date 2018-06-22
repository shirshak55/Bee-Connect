# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :group_message, dependent: :destroy
  has_many :group_memberships, dependent: :destroy
  has_many :members, through: :group_memberships, source: :user
  has_many :posts, as: :postable, dependent: :destroy

  has_attached_file :thumbnail_image # , styles: { :small => "330x" }
  has_attached_file :timeline_image # , styles: { :small => "330x" }

  validates :thumbnail_image, presence: true
  validates :timeline_image, presence: true
  validates :name, presence: true
  validates :description, presence: true

  validates_attachment_content_type :thumbnail_image, content_type: %r{image/.*}
  validates_attachment_content_type :timeline_image, content_type: %r{image/.*}
end
