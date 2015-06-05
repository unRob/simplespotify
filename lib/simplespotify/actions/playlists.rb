module SimpleSpotify
  module Actions
    module Playlists


      def playlist owner, playlist=nil, fields:{}, market: nil
        fields = fields.join(',') if fields.is_a? Array
        options = {
          fields: fields
        }

        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        res = get "users/#{id_for(owner)}/playlists/#{id_for(playlist)}", options_with_market(market, options)
        Model::Playlist.new(res.body)
      end


      def playlists owner, limit: 20, offset: 0
        Model::Collection.for(:playlists, get("users/#{id_for(owner)}/playlists", {limit: limit, offset: offset}))
      end


      #--------------
      # Creation/Update
      #--------------
      def playlist_create user, name, public: true
        res = post "users/#{id_for(user)}/playlists", {name: name, public: public}
        Model::Playlist.new(res.body)
      end


      def playlist_change_details owner, playlist=nil, name: nil, public: nil
        data = {}
        data[:name] = name if name
        data[:public] = public if public

        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        put "users/#{id_for(owner)}/playlists/#{id_for(playlist)}", data
      end


      #--------------
      # Tracks
      #--------------
      def playlist_tracks owner, playlist=nil, fields: {}, limit: 20, offset: 0, market: nil
        fields = fields.join(',') if fields.is_a? Array
        options = {
          fields: fields,
          limit: limit,
          offset: offset
        }

        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        res = get "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/tracks", options_with_market(market, options)
        Model::Playlist.new(res.body)
      end


      def playlist_tracks_add owner, playlist=nil, tracks: [], position: nil
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        tracks = case tracks
          when Array then tracks.map {|t|
            t.is_a?(Model::Track) ? t.id : t
          }
          when String then tracks.split(',')
        end.map {|t| "spotify:track:#{t.split(':').last}" }


        data = {}
        data[:position] = position if position
        data[:uris] = tracks

        res = post "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/tracks", data
        res.body[:snapshot_id]
      end


      def playlist_tracks_remove owner, playlist=nil, tracks: nil, positions: nil, snapshot_id: nil
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        data = {}
        tracks = case tracks
          when Array then tracks.map {|t|
            case t
              when Model::Track then {uri: t.uri}
              when String then {uri: "spotify:track:#{t.split(':').last}"}
              when Hash
                t[:positions] = [t[:positions]].flatten if t[:positions]
                t[:uri] = "spotify:track:#{t[:uri].split(':').last}"
            end
          }
          when String then tracks.split(',')
          else nil
        end

        data[:tracks] = tracks if tracks
        data[:positions] = [positions].flatten if positions
        data[:snapshot_id] = snapshot_id if snapshot_id

        puts data

        res = delete "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/tracks", data
        res.body[:snapshot_id]
      end


      def playlist_tracks_reorder owner, playlist=nil, start: 0, length: 1, before: nil, snapshot_id: nil
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        raise "Must set `before` option when reordering playlist tracks" unless before

        data = {
          range_start: start,
          range_length: length,
          insert_before: before
        }
        data[:snapshot_id] = snapshot_id unless snapshot_id.nil?

        res = put "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/tracks", data
        res.body[:snapshot_id]
      end


      def playlist_tracks_replace owner, playlist=nil, tracks: []
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end

        data[:uris] = tracks.map { |t|
          case t
            when Model::Track then t.uri
            when String then "spotify:track:#{t.split(':').last}"
          end
        }

        res = put "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/tracks", data
        res.body[:snapshot_id]
      end



      #--------------
      # Follows
      #--------------
      def playlist_follow owner, playlist=nil, public: true
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end
        put "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/followers", {public: public}
      end


      def playlist_unfollow owner, playlist=nil
        if owner.is_a? Model::Playlist
          playlist = owner
          owner = playlist.owner
        end
        delete "users/#{id_for(owner)}/playlists/#{id_for(playlist)}/followers"
      end

    end
  end
end