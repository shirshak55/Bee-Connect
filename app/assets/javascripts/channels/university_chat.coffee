$(document).ready ->
  group_messages = $('#group_messages')
  if $('#group_messages').length > 0
    messages_to_bottom = -> group_messages.scrollTop(group_messages.prop("scrollHeight"))
    messages_to_bottom()

    App.group_chat = App.cable.subscriptions.create {
        channel: "GroupChatsChannel"
        group_id: group_messages.data('group-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        group_messages.append data['message']
        messages_to_bottom()

      send_message: (message, group_id) ->
        @perform 'send_message', message: message, group_id: group_id

    $('#new_group_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#group_message_body')
      if $.trim(textarea.val()).length >= 1
        App.group_chat.send_message textarea.val(), group_messages.data('group-id')
        textarea.val('')
      e.preventDefault()
      return false
    $('#new_group_message').keypress (e) ->
       if e && e.keyCode == 13
         e.preventDefault()
         $(this).submit()