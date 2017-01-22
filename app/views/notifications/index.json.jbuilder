json.array! @notifications do |notification|
  json.id notification.id
  json.type notification.notifiable_type.underscore.pluralize
  json.unread !notification.read_at?
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}",locals: {notification: notification}, formats: [:html]
end