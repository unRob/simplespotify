module SimpleSpotify
  module Actions
    module Artists


      def artist artist
        response = get "artist/#{id_for(artist)}"
        Model::Artist.new(response.body)
      end


      def artists *artists
        artists = artists.map {|a|
          id_for(a)
        }.join(',')

        response = get "artists", {ids: artists}
        Model::Collection.of(:artists, response.body)
      end


      def artist_albums artist, album_type: nil, market: nil, limit: 20, offset: 0
        options = {album_type: album_type, limit: limit, offset: offset}
        response = get "artists/#{id_for(artist)}/albums", options_with_market(market, options)
        Model::Collection.of(:artists, response.body)
      end


      def top_tracks artist, market=nil
        id = id_for(artist)
        market = market || @market
        raise "Market required for top tracks" unless market

        response = get "artists/#{id}/top-tracks", {country: market}
        Model::Collection.of(:tracks, response.body)
      end


      def related_artists artist
        response = get "artists/#{id_for(artist)}/related-artists"
        Model::Collection.of(:artists, response.body)
      end


    end
  end
end
