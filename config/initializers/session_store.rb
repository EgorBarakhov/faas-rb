# frozen_string_literal: true

Rails.application.configure do
  # This also configures session_options for use below
  config.session_store :cookie_store, key: '_faas_rb_app_session'

  # Required for all session management (regardless of session_store)
  config.middleware.use ActionDispatch::Cookies

  config.middleware.use config.session_store, config.session_options
end
