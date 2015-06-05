module SimpleSpotify
  module Model
    class Artist
      include Resource

      merge :external_ids

      prop :genres
      many :images
      prop :name
      prop :popularity

      prop :followers


      def related_artists! client=nil
        client ||= SimpleSpotify.default_client
        @related_artists = client.related_artists(id)
      end

      def related_artists client=nil
        @related_artists || related_artists!(client)
      end


      def top_tracks! client=nil
        client ||= SimpleSpotify.default_client
        @top_tracks = client.top_tracks(id)
      end

      def top_tracks client=nil
        @top_tracks || top_tracks!(client)
      end

      def albums! client=nil
        client ||= SimpleSpotify.default_client
        @albums = client.artist_albums(id)
      end

    end
  end
end