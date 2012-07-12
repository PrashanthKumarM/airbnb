# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_airbnb_session',
  :secret      => '8f6d400af88154a26051ac8e1fbfee0934390cc08c4d5ca9603853af7dbf44d11b5b8f102b33df8789974d27399c70d76be7eb6045c28604edfbdf0c3b9b80a5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
