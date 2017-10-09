module SimpleSpotify
  module Actions
    module Player

      def recently_played limit=50, after=nil, before=nil
        query = {
          limit: limit,
        }
        query[:after] = after if after
        query[:before] = before if before
        response = get "me/player/recently-played", query: query

        Model::Collection.of(SimpleSpotify::Model::PlayEvent, response.body)
      end

    end
  end
end