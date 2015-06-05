module SimpleSpotify
  class Request

    attr_accessor :endpoint, :method, :json, :data, :tries

    def initialize endpoint, opts = {}
      endpoint = endpoint.join('/') if endpoint.respond_to? :join

      @endpoint = endpoint
      @headers = opts[:headers] || {}
      @method = opts[:method] || :get
      @json = opts[:json] || (@method != :get)
      @tries = 0
      @data = opts[:data]
      @query = opts[:query]
      @private = opts[:private] || true
    end


    def private?
      @private;
    end


    def method
      @method.to_sym
    end


    def options
      return {} unless data
      if method == :get
        {query: data}
      else
        opts = {body: data.to_json}
        opts[:query] = @query if @query
        opts
      end
    end


    def headers
      h = @headers
      h['Content-type'] = 'application/json' if json
      h
    end


    def full_url
      SimpleSpotify::ENDPOINT + endpoint.to_s.gsub(SimpleSpotify::ENDPOINT, '')
    end

  end
end