module SimpleSpotify
  module Model
    class User
      include Resource

      prop :birthdate
      prop :country
      prop :display_name
      prop :email

      prop :external_urls
      prop :followers

      many :images
      prop :product

      def premium?
        @product == 'premium'
      end


      #--------------
      # Saved tracks
      #--------------
      def save_tracks ids, client=nil
        client ||= SimpleSpotify.default_client
        client.save_tracks(ids)
      end


      def remove_tracks ids, client=nil
        client ||= SimpleSpotify.default_client
        client.remove_tracks(ids)
      end


      def saved_tracks_include? ids, client=nil
        client ||= SimpleSpotify.default_client
        client.saved_tracks_include?(ids)
      end


      #--------------
      # Follows
      #--------------
      def follow type, ids, client=nil
        client ||= SimpleSpotify.default_client
        client.user_follow(type, ids)
      end


      def unfollow type, ids, client=nil
        client ||= SimpleSpotify.default_client
        client.user_unfollow(type, ids)
      end


      def following? type, ids, client=nil
        client ||= SimpleSpotify.default_client
        client.user_following(type, ids)
      end


      #--------------
      # Playlists
      #--------------

      def playlists! client=nil, fields: {}, market: nil, limit: 20, offset: 0
        client ||= SimpleSpotify.default_client
        client.playlists(self, fields: fields, market: market, limit: limit, offset: offset)
      end


      def follow_playlist owner, playlist=nil, client=nil, public: true
        client ||= SimpleSpotify.default_client
        client.playlist_follow(owner, playlist, public: public)
      end


      def follow_playlist owner, playlist=nil, client=nil
        client ||= SimpleSpotify.default_client
        client.playlist_unfollow(owner, playlist)
      end

    end
  end
end