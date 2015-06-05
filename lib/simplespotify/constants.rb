module SimpleSpotify
  #--------------
  # Constants
  #--------------

  AUTHORIZATION_URL = 'https://accounts.spotify.com/authorize'
  TOKEN_URL = 'https://accounts.spotify.com/api/token'

  ENDPOINT = 'https://api.spotify.com/v1/'

  # Upper bound when trying to refresh the authentication token
  MAX_RETRIES = 2

end