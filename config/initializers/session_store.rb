# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_itsaconference_session',
  :secret      => '8051bc2b510a31ad52e1a23b8c030e7ec3cefccf01966902d7bd67132df28e7f5eb73c67874b5f3898d5116c62c6e2e567c49cf225a4366f6dc524e70475dfb2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
