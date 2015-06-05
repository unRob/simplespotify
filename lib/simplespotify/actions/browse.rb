module SimpleSpotify
  module Actions
    module Browse


      def featured_playlists locale: nil, country: nil, timestamp: nil, limit: 20, offset: 0
        locale ||= ENV['LANG'].split('.').first if ENV['LANG']
        timestamp = timestamp.to_time if timestamp.is_a Date
        timestamp = timestamp.iso8601 if timestamp.is_a? Time

        options = {
          locale: locale,
          country: country || @market,
          timestamp: timestamp,
          limit: limit,
          offset: offset
        }.reject {|k,v| v.nil? || v==''}.to_h

        response = get "browse/featured-playlists", options
        Model::Collection.of(:playlists, response.body[:playlists])
      end


      def new_releases country: nil, limit: 20, offset: 0
        options = {limit: limit, offset: offset}
        market = country || @market
        options[:country] = market if market

        response = get "browse/new-releases", options
        Model::Collection.of(:albums, response.body[:albums])
      end


      def categories country: nil, locale: nil, limit: 20, offset: 0
        options = {limit: limit, offset: offset}

        market = country || @market
        options[:country] = market if market

        locale ||= ENV['LANG'].split('.').first if ENV['LANG']
        options[:locale] = locale if locale

        response = get "browse/categories", options
        Model::Collection.of(Model::Category, response.body[:categories])
      end


      def category category, country: nil, locale: nil
        options = {}
        market = country || @market
        options[:country] = market if market

        locale ||= ENV['LANG'].split('.').first if ENV['LANG']
        options[:locale] = locale if locale

        response = get "browse/categories/#{id_for(category)}"
        Model::Category.new(response)
      end


      def category_playlists category, country: nil, limit: 20, offset: 0
        options = {limit: limit, offset: offset}

        market = country || @market
        options[:country] = market if market

        response = get "browse/categories/#{id_for(category)}/playlists", options
        Model::Collection.of(:playlists, response.body[:playlists])
      end


    end
  end
end