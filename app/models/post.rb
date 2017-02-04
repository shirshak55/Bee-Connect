class Post < ActiveRecord::Base
  acts_as_votable

  belongs_to :postable,polymorphic: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :content, length: { maximum: 5000 }

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  scope :of_followed_users, -> (following_users) { where user_id: following_users } 

  def is_pdf?
    attachment.instance.attachment_content_type =~ %r(pdf)
  end

  def is_image?
    attachment.instance.attachment_content_type =~ %r(image)
  end

end
