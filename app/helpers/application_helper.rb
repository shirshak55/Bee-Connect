module ApplicationHelper
  def alert_for(flash_type)
    {
      success: 'alert-success text-center',
      error: 'alert-danger text-center',
      alert: 'alert-warning text-center',
      notice: 'alert-info text-center'
    }[flash_type.to_sym] || flash_type.to_s
  end
  def current_user_is_following(current_user_id, followed_user_id)
    relationship = Follow.find_by(follower_id: current_user_id, following_id: followed_user_id)
    return true if relationship
  end

  def form_image_select(post)
    return image_tag post.attachment.url(:original),
                     id: 'image-preview',
                     class: 'img-responsive' if post.attachment.exists?
    image_tag '', id: 'image-preview', class: 'img-responsive'
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'default-avatar.jpg', id: 'image-preview',
                                    class: 'img-responsive img-circle profile-image'
  end
  def post_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                     class: 'img-responsive post__avatar' if user.avatar.exists?
    image_tag 'default-avatar.jpg',class: 'img-responsive post__avatar'
  end
  def comment_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                     class: 'img-responsive comment__avatar' if user.avatar.exists?
    image_tag 'default-avatar.jpg',class: 'img-responsive comment__avatar'
  end
  def chat_avatar_select(user)
    return image_tag user.avatar.url(:medium),
                     class: 'img-responsive chat__avatar' if user.avatar.exists?
    image_tag 'default-avatar.jpg',class: 'img-responsive chat__avatar'
  end
  def online_status(user)
    content_tag(:span, nil, class: "user-#{user.id} online_status #{'online' if user.online?}") 
end
end