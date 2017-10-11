module SimpleSpotify
  class Authorization

    attr_accessor :access_token, :refresh_token
    attr_reader :client_id

    def self.login_uri redirect, client, state: nil, scope: nil, dialog: false
      params = {
        client_id: client.to_h[:client_id],
        response_type: 'code',
        redirect_uri: redirect,
      }

      params[:state] = state unless state.nil?
      if scope
        scope = scope.join(' ') if scope.is_a? Array
        params[:scope] = scope
      end
      params[:show_dialog] = dialog.to_s

      params_qs = params.map {|k,v|
        "#{k}=#{URI::encode(v)}"
      }.join('&')
      return SimpleSpotify::AUTHORIZATION_URL + '?' + params_qs
    end


    def self.from_code code, client: {}, redirect: nil
      params = {
        grant_type: 'authorization_code',
        redirect_uri: redirect,
        code: code,
      }.merge(client.to_h)

      response = HTTParty.post SimpleSpotify::TOKEN_URL, query: params

      body = JSON.parse(response.body, symbolize_names: true)
      if response.code != 200
        raise SimpleSpotify::Error::AuthorizationError.new(body)
      end

      return Authorization.new(body)
    end


    def initialize access_token: nil, refresh_token:nil, client: {}, token_type: nil, expires_in: nil, scope: nil
      @access_token = access_token
      @refresh_token = refresh_token
      @client = client.to_h
      @client_id = @client[:client_id]
    end


    def headers
      {'Authorization' => "Bearer #{@access_token}"}
    end


    def refresh!
      params = {
        grant_type: 'refresh_token',
        refresh_token: @refresh_token
      }.merge(@client)

      response = HTTParty.post SimpleSpotify::TOKEN_URL, query: params

      body = JSON.parse(response.body, symbolize_names: true)
      if response.code != 200
        raise SimpleSpotify::Error::AuthorizationError.new(body)
      end

      @access_token = body[:access_token]
      @callback.call(self) if @callback
    end


    def on_refresh &block
      @callback = block
    end


    def to_h
      {
        access_token: access_token,
        refresh_token: refresh_token
      }
    end


  end
end