# frozen_string_literal: true

module GroupsHelper
  def current_user_is_joined(current_user_id, group_id)
    relationship = GroupMembership.find_by(user_id: current_user_id, group_id: group_id)
    true if relationship
  end

  def moderation_links_and_power(post)
    current_user == post.user || current_user.role.name == 'admin' || (current_user.group_moderator?(post.postable.id) && !post.user.group_moderator?(post.postable.id))
  end

  def moderation_power(_user, group)
    return true if current_user.role.name == 'admin' || current_user.group_moderator?(group.id)
    false
  end
end
