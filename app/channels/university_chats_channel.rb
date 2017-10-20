class GroupChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_chats_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    if(current_user.is_group_approved( data['group_id']) )
      current_user.group_messages.create!(body: data['message'], group_id: data['group_id'])
    end
  end
end