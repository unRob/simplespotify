module SimpleSpotify
  module Model
    class Playlist
      include Resource

      prop :name
      prop :description

      prop :collaborative
      prop :public

      many :images
      one :owner, kind: :user

      prop :snapshot_id

      many :tracks, kind: :playlist_track, paginated: true

      def public?
        @public == true
      end


      def change_details! client=nil
        client ||= SimpleSpotify.default_client
        client.change_details(self, name: name, public: @public)
      end

      #--------------
      # Tracks
      #--------------
      def tracks! client=nil, options={}
        client ||= SimpleSpotify.default_client
        client.playlist_tracks(self, options)
      end

      def add_tracks tracks, position=nil, client=nil
        client ||= SimpleSpotify.default_client
        client.playlist_tracks_add(self, tracks: tracks, position: position)
      end

      def remove_tracks client=nil, tracks: nil, positions: nil, snapshot_id: nil
        client ||= SimpleSpotify.default_client
        snapshot_id ||= @snapshot_id unless positions.nil?
        client.playlist_tracks_remove(self, tracks: tracks, positions: positions, snapshot_id: snapshot_id)
      end

      def reorder_tracks client=nil, payload
        client ||= SimpleSpotify.default_client
        client.playlist_tracks_reorder(self, payload)
      end

      def replace_tracks client=nil, tracks: []
        client ||= SimpleSpotify.default_client
        client.playlist_tracks_reorder(self, tracks: tracks)
      end


      #--------------
      # Follows
      #--------------
      def follow client=nil, public: true
        client ||= SimpleSpotify.default_client
        client.playlist_follow(self, public: public)
      end

      def unfollow
        client ||= SimpleSpotify.default_client
        client.playlist_unfollow(self)
      end


      #--------------
      # Create
      #--------------
      def self.create user, name, client=nil, public:true
        client ||= SimpleSpotify.default_client
        client.playlist_create(user, name, public: public)
      end

    end


    class PlaylistTrack
      include Resource

      prop :added_at
      prop :added_by
      prop :is_local
      one :track

    end
  end
end