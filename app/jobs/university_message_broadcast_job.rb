class UniversityMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "university_chats_#{message.university.id}_channel",message: render_message(message)
  end

  private
    def render_message(message)
      UniversitiesController.render partial: 'universities/messages', locals: {message: message}
    end
end