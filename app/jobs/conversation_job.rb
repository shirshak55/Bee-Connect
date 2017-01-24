class ConversationJob < ApplicationJob
  queue_as :high_priority

  def perform(personal_message)
    ActionCable.server.broadcast "conversation_#{personal_message.conversation.id}_channel",
                                 message: render_message(personal_message),
                                 conversation_id: personal_message.conversation.id,
                                 message_user_id: personal_message.user_id
  end

  private
  def render_message(personal_message)
    PersonalMessagesController.render partial: 'personal_messages/personal_message',
                                      locals: {personal_message: personal_message}
  end
end
