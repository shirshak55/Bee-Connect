module GroupsHelper
  def current_user_is_joined(current_user_id, group_id)
    relationship = GroupMembership.find_by(user_id: current_user_id, group_id: group_id)
    return true if relationship
  end
  def moderation_links_and_power(post)
    return current_user == post.user || current_user.role.name =='admin' || (current_user.is_univerisity_moderator(post.postable.id) && !post.user.is_univerisity_moderator(post.postable.id))
  end
  def moderation_power(user,group)
    if current_user.role.name == 'admin'
        return true
    end
    if current_user.is_univerisity_moderator(group.id) && !user.is_univerisity_moderator(group.id)
      return true
    end
    if !current_user.is_univerisity_moderator(group.id)
      return false
    end
    return false
  end
end
