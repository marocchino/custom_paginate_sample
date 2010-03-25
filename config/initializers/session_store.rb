# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_custom_paginate_sample_session',
  :secret      => '27fc59f2bb21a093232e501c081ea104df88b90b5453c0f659dfb6dec5c94a0f3bc57ca11939ac0abeb293ca5606a7230defef969093cd72ed2697e1ac799789'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
