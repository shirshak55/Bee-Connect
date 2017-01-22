$(document).ready ->
  university_messages = $('#university_messages')
  if $('#university_messages').length > 0
    messages_to_bottom = -> university_messages.scrollTop(university_messages.prop("scrollHeight"))
    messages_to_bottom()

    App.university_chat = App.cable.subscriptions.create {
        channel: "UniversityChatsChannel"
        university_id: university_messages.data('university-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        university_messages.append data['message']
        messages_to_bottom()

      send_message: (message, university_id) ->
        @perform 'send_message', message: message, university_id: university_id

    $('#new_university_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#university_message_body')
      if $.trim(textarea.val()).length >= 1
        App.university_chat.send_message textarea.val(), university_messages.data('university-id')
        textarea.val('')
      e.preventDefault()
      return false
    $('#new_university_message').keypress (e) ->
       if e && e.keyCode == 13
         e.preventDefault()
         $(this).submit()