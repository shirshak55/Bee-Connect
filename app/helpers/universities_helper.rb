module UniversitiesHelper
  def current_user_is_joined(current_user_id, university_id)
    relationship = UniversityMembership.find_by(user_id: current_user_id, university_id: university_id)
    return true if relationship
  end
  def moderation_links_and_power(post)
    return current_user == post.user || current_user.role.name =='admin' || (current_user.is_univerisity_moderator(post.postable.id) && !post.user.is_univerisity_moderator(post.postable.id))
  end
  def moderation_power(user,university)
    if current_user.role.name == 'admin'
        return true
    end
    if current_user.is_univerisity_moderator(university.id) && !user.is_univerisity_moderator(university.id)
      return true
    end
    if !current_user.is_univerisity_moderator(university.id)
      return false
    end
    return false
  end
end
