class Group < ApplicationRecord
  validates :thumbnail_image, presence: true
  validates :timeline_image, presence: true
  validates :name, presence: true
  validates :description, presence: true

  has_attached_file :thumbnail_image #, styles: { :small => "330x" }
  has_attached_file :timeline_image #, styles: { :small => "330x" }

  validates_attachment_content_type :thumbnail_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :timeline_image, :content_type => /\Aimage\/.*\Z/

  has_many :posts,as: :postable

  has_many :group_memberships
  has_many :members,through: :group_memberships,source: :user

  has_many :group_message ,dependent: :destroy
end
