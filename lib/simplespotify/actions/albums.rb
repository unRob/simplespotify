module SimpleSpotify
  module Actions
    module Albums

      def album album, market: nil
        response = get "albums/#{id_for(album)}", options_with_market(market, {})
        Model::Album.new(response.body)
      end


      def albums *albums, market: nil
        albums = albums.map {|a|
          id_for(a)
        }.join(',')

        response = get "albums", options_with_market(market, {ids: albums})
        Model::Collection.of(:albums, response.body)
      end


      def album_tracks album, limit: 20, offset: 0, market: nil
        options = options_with_market(market, {limit: limit, offset: offset})
        response = get "albums/#{id_for(album)}/tracks", options
        Model::Collection.of(:tracks, response.body)
      end


    end
  end
end