module SimpleSpotify
  class Client

    attr_accessor :id, :secret, :session, :market

    [:Albums, :Tracks, :Artists, :Users, :Browse, :Playlists].each do |action|
      require "simplespotify/actions/#{action.downcase}"
      include Actions.const_get(action)
    end

    def initialize client_id, client_secret, default: true
      @id = client_id
      @secret = client_secret
      @session = nil
      @market = nil
      SimpleSpotify.default_client = self if default
    end

    [:get, :post, :put, :delete].each do |verb|
      define_method(verb) do |msg, data={}|
        unless msg.is_a? SimpleSpotify::Request
          msg = Request.new(msg, {method: verb, data: data})
        end
        SimpleSpotify.dispatch msg, session: session
      end
    end


    def search type, term, market: nil, limit: 20, offset: 0, filters: {}
      type = type.to_s.gsub(/s$/, '').to_sym
      types = [:album, :artist, :playlist, :track]
      raise "Can't search for <#{type}> only: #{types.join(',')}" unless types.include?(type)

      params = {q: term}
      params[:market] = market || @market
      params[:limit] = limit if limit
      params[:offset] = offset if offset

      filters = filters.map { |filter, value|
        value = value.join(',') if value.is_a?(Array)
        value = [value.min, value.max].map(&:to_s).join('-') if value.is_a?(Range)
        %{#{filter}:"#{value}"}
      }

      params[:q] = ([term]+filters).join(' ')
      params[:type] = type

      params = params.reject {|k,v| v.nil?}.to_h
      response = get "search", params

      Model::Collection.of(type, response.body["#{type}s".to_sym])
    end


    def to_h
      {
        client_secret: secret,
        client_id: id
      }
    end


    private

    def id_for object
      return object.id if object.is_a? Resource
      object
    end

    def options_with_market user_market, options={}
      options[:market] = user_market || @market
      options.reject {|k,v| v.nil? || v=='' }.to_h
    end

  end
end