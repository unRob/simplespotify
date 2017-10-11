module SimpleSpotify
  #--------------
  # Constants
  #--------------

  AUTHORIZATION_URL = 'https://accounts.spotify.com/authorize'
  TOKEN_URL = 'https://accounts.spotify.com/api/token'

  ENDPOINT = 'https://api.spotify.com/v1/'

  # Upper bound when trying to refresh the authentication token
  MAX_RETRIES = 2

  # Should we block the whole program until we can retry a rate-limited request? set to
  # "please" if you'd like to enable this potentially web-request blocking option
  RETRY_IF_RATELIMITED = false

end