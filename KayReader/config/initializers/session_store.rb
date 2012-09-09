# Be sure to restart your server when you modify this file.

# KayReader::Application.config.session_store :cookie_store, key: '_KayReader_session'

require 'action_dispatch/middleware/session/dalli_store'

KayReader::Application.config.session_store :dalli_store
KayReader::Application.config.session = {
  :key => '_kayreader_session',
  :httponly => 'true'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# KayReader::Application.config.session_store :active_record_store
