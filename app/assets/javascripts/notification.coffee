class UserNotification
  constructor: ->
    @notifications = $("[data-behaviour='notifications']");
    @messages =  $("[data-behaviour='message-notifications']")

  setup: ->
    if @notifications.length > 0
      @makeNotificationsAjaxRequest()
      @notifications.on "click" , @handleNotificationClick
      @messages.on "click" , @handleMessageNotificationClick

  makeNotificationsAjaxRequest: ->
    $.ajax(
      url:'/notifications.json'
      dataType: "JSON",
      method: "GET",
      success: @handleSuccess
    )

  handleNotificationClick: (e) =>
    $.ajax(
      url: "/notifications/mark_notifications_as_read",
      dataType: "JSON",
      method: "POST",
      success: ->
        $("[data-behaviour='notifications-count']").html(0);
  )

  handleMessageNotificationClick: (e) =>
    $.ajax(
      url: "/notifications/mark_messages_notification_as_read",
      dataType: "JSON",
      method: "POST",
      success: ->
        $("[data-behaviour='message-notifications-count']").html(0);
  )

  handleSuccess: (data)=>
    notification_items = $.map data, (notification) ->
      if(notification.type != 'conversations')
        notification.template

    unread_notication_count = 0
    $.each data, (i, notification) ->
      if(notification.type != 'conversations')
        if notification.unread
          unread_notication_count += 1

    $("[data-behaviour='notifications-count']").html(unread_notication_count);
    $("[data-behaviour='notifications-item']").html(notification_items);

    message_items = $.map data, (notification) ->
      if(notification.type == 'conversations')
        notification.template

    unread_messages_count = 0
    $.each data, (i, notification) ->
      if(notification.type == 'conversations')
        if notification.unread
          unread_messages_count += 1
    $("[data-behaviour='message-notifications-count']").html(unread_messages_count);
    $("[data-behaviour='message-notifications-item']").html(message_items);


jQuery ->
  (new UserNotification).setup()
  App.user_notifications = App.cable.subscriptions.create {
      channel: "UserNotificationsChannel"
    },
    received: (data) ->
      (new UserNotification).makeNotificationsAjaxRequest()
  return