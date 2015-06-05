# SimpleSpotify
[![Gem Version](https://badge.fury.io/rb/simplespotify.svg)](http://badge.fury.io/rb/simplespotify)
[![Travis Build](https://travis-ci.org/unRob/simplespotify.svg)](https://travis-ci.org/unRob/simplespotify)

A lousy and very badly programmed Spotify API Client written in Ruby.

If you'd rather have a **proper, working, supported library** I do recommend [RSpotify](https://rubygems.org/gems/rspotify).

## Installation

Seriously, don't just run `gem install simplespotify`, it'll ruin your day.

## Usage

You've suffered enough [registering an app with Spotify](https://developer.spotify.com/my-applications/#!/applications/create) and setting up your redirection URIs, why would you want to...?

```ruby
client = SimpleSpotify::Client.new(client_id, client_secret)
redirect_uri = 'http://your-redirect-uri'

if ARGV[0] == 'login'
  login_url = SimpleSpotify::Authorization.login_uri redirect_uri, client, scope: 'playlist-modify-public user-read-private'
  puts login_url
elsif ARGV[0] == 'code'
  # Copy the `code` param from your browser...
  code = ARGV[1].strip
  auth = SimpleSpotify::Authorization.from_code code, client: client, redirect: redirect_uri

  puts auth.to_h
else
  # now do the same for the `access_token` and `refresh_token`
  token = ARGV[0]
  refresh_token = ARGV[1]
  client.session = SimpleSpotify::Authorization.new access_token: token, refresh_token: refresh_token, client: client

  me = client.me
  puts me.to_h
end
```

### Oh, joy...

#### API

It's all syntactic sugar, but not the right kind that makes you happy and stuff, but the distasteful one that comes with coffee in an airplane. Seriously, it's not even properly tested!

```ruby
playlist = client.playlist(some_user_id, some_playlist_id)
if playlist.tracks.total >= 10
  extra = (playlist.tracks.total - 10)
  playlist.remove_tracks positions: (0..extra).to_a
end

playlist.add_tracks('spotify:track:1SWhZ2rIxTPv9UcexFnPSU')
# or
client.playlist_tracks_add(playlist, tracks: '1SWhZ2rIxTPv9UcexFnPSU'})
# or even
client.post "/user/#{_user_}/playlists/#{_playlist_id_}/tracks", {uris: ['spotify:track:1SWhZ2rIxTPv9UcexFnPSU']}
```

#### Dealing with refreshing tokens
```ruby
client.session.on_refresh do |sess|
  # Then token was refreshed on the last call
  cache[:spotify_session] = sess.to_h
end

# And maybe later...
credentials = cache[:spotify_session]
credentials[:client] = client
client.session = SimpleSpotify::Authorization.new(credentials)

```