# frozen_string_literal: true

class GroupMessageBroadcastJob < ApplicationJob
  queue_as :high_priority

  def perform(message)
    ActionCable.server.broadcast "group_chats_#{message.group.id}_channel", message: render_message(message)
  end

  private

  def render_message(message)
    GroupsController.render partial: 'groups/messages', locals: { message: message }
  end
end
