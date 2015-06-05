module SimpleSpotify
  module Actions
    module Tracks

      def track id, market: nil
        res = get "tracks/#{id_for(id)}", options_with_market(market)
        Model::Track.new(res.body)
      end


      def tracks ids, market: nil
        if ids.is_a? Array
          ids.map { |i|
            id_for(i)
          }.join(',')
        end

        Model::Collection.of(:tracks, response.body)
      end


      #--------------
      # Saved tracks
      #--------------
      def saved_tracks limit: 20, offset: 0, market: nil
        response = get "me/tracks", options_with_market(market, {limit: limit, offset: offset})
        Model::Collection.of(Model::PlaylistTrack, response.body)
      end


      def saved_tracks_include? ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        res = get "me/tracks/contains", {ids: ids}
        ids.zip(res.body).to_h
      end


      def save_tracks ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        put "me/tracks", {ids: ids}
      end


      def remove_tracks ids
        if ids.is_a? Array
          ids.map { |i|
            i.is_a?(Resource) ? i.id : i;
          }.join(',')
        end

        delete "me/tracks", {ids: ids}
      end


    end
  end
end