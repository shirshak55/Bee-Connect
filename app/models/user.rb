class User < ActiveRecord::Base
  before_create :set_default_role
  acts_as_voter

  # Just For Devise
  attr_accessor :login

  validates :user_name, :uniqueness => {:case_sensitive => false },length: { minimum: 2, maximum:50 }
  validates_format_of :user_name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:user_name].nil?
        where(conditions).first
      else
        where(user_name: conditions[:user_name]).first
      end
    end
  end

  validates :first_name, :last_name ,:user_name ,:presence => true,length: { minimum: 2, maximum:50 }


  has_many :posts,as: :postable, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy

  has_many :notifications,foreign_key: :recipient_id

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_many :group_memberships, dependent: :destroy

  has_many :group_messages ,dependent: :destroy

  belongs_to :role

  # For PaperClip Gem
  has_attached_file :avatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def full_name
    first_name + " " + last_name
  end

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end
  def delete_group_user(group_id)
    group_memberships.find_by(group_id: group_id).destroy
  end
  def join_group_toggle(group_id)
    if(group_memberships.find_by(group_id: group_id))
      delete_group_user(group_id);
    else
      group_memberships.create(group_id: group_id,role_id: Role.where(name: 'group_pending_approval').first.id)
    end
  end

  def group_role_name(group_id)
    rid = group_memberships.find_by(group_id: group_id)
    if(rid.present?)
      return rid.role.name
    end
    'group_pending_approval'
  end
  def is_group_admin(group_id)
    role.name == 'admin' or role.name == 'moderator'
  end
  def is_univerisity_moderator(group_id)
    group_role_name(group_id) == 'moderator' or is_group_admin(group_id)
  end
  def is_group_approved(group_id)
    is_univerisity_moderator(group_id) or group_role_name(group_id) == 'group_approved'
  end
  def group_role_update(group_id,role_name)
    group_memberships.find_by(group_id: group_id).update(role_id: Role.where(name: role_name).first.id)
  end

  scope :users_to_be_followed, ->(user) { where(following: user) }
  scope :search_name, -> (name) { where("lower(user_name) like ?", "%#{name}%")}

  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
