class UniversityChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "university_chats_#{params['university_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    if(current_user.is_university_approved( data['university_id']) )
      current_user.university_messages.create!(body: data['message'], university_id: data['university_id'])
    end
  end
end