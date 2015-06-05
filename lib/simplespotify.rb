require "simplespotify/version"
require "simplespotify/constants"
require 'httparty'

module SimpleSpotify
  autoload :Authorization, 'simplespotify/authorization'
  autoload :Client, 'simplespotify/client'
  autoload :Request, 'simplespotify/request'
  autoload :Response, 'simplespotify/response'
  autoload :Error, 'simplespotify/errors'
  autoload :Resource, 'simplespotify/resource/resource'

  module Model
    [:Album, :Artist, :Image, :Track, :Collection, :Playlist, :Category, :User].each do |model|
      autoload model, "simplespotify/models/#{model}"
    end
  end


  def self.default_client= client
    @@client = client
  end

  def self.default_client
    @@client
  end


  def self.log msg
    return true unless ENV['DEBUG']
    if msg.is_a? String
      $stdout.puts msg
    else
      $stdout.puts pp msg
    end
  end


  def self.dispatch request, session: nil
    headers = request.headers
    headers = headers.merge(session.headers) if session && request.private?

    options = {headers: headers}.merge(request.options)

    request.tries += 1;

    log "#{request.method.to_s.upcase} <#{request.full_url}>"
    log request.options

    http = HTTParty.send(
      request.method,
      request.full_url,
      options
    )

    log "HTTP #{http.code}"
    log http.body
    log "---"

    if session && http.code == 401 && http.body =~ /The access token expired/
      if request.tries < SimpleSpotify::MAX_RETRIES
        session.refresh!
        return self.dispatch(request, session: session)
      else
        raise SimpleSpotify::Error::AuthorizationError(JSON.parse(http.body, symbolize_names: true))
      end
    end

    return Response.new(http.code, http.body, request)
  end

end
