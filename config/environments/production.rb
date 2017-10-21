Rails.application.configure do
  config.cache_classes = true

  config.public_file_server.enabled = true

  config.action_cable.allowed_request_origins = ["http://beeconnect.com","https://beeconnect.com"]

  config.eager_load = true

  config.consider_all_requests_local       = true

  config.action_controller.perform_caching = true

  config.assets.js_compressor = :uglifier

  config.assets.compile = false

  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # config.force_ssl = true

  config.log_level = :debug

  config.log_tags = [ :request_id ]

  config.active_job.queue_adapter = :sidekiq

  config.action_mailer.perform_caching = false

  config.action_mailer.raise_delivery_errors = true

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new


  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = { :host => 'http://chatounce.com' }
end
