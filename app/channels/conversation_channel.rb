class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from("conversation_#{params['conversation_id']}_channel")
  end

  def send_message(data)
    conversation = Conversation.find_by(id: data['conversation_id'])
    if conversation && conversation.participates?(current_user)
      personal_message = current_user.personal_messages.build({body: data['message']})
      personal_message.conversation = conversation
      personal_message.save!
      if(current_user.id == personal_message.conversation.author_id)
        Notification.find_or_initialize_by(recipient: personal_message.conversation.receiver,actor: current_user,action: 'messaged',notifiable: personal_message.conversation).update_attributes!(read_at: nil)
      end
      if(current_user.id == personal_message.conversation.receiver_id)
        Notification.find_or_initialize_by(recipient: personal_message.conversation.author,actor: current_user,action: 'messaged',notifiable: personal_message.conversation).update_attributes!(read_at: nil)
      end
    end
  end
end