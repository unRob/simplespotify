module SimpleSpotify
  module Models
    class Category

      many :icons, kind: :image
      prop :name

      def playlists client=nil, country: nil, limit: 20, offset: 0
        @playlists || playlists!(client, country: country, limit: limit, offset: offset)
      end

      def playlists! client=nil, country: nil, limit: 20, offset: 0
        client ||= SimpleSpotify.default_client
        @playlists = client.category_playlists(id, country: country, limit: limit, offset: offset)
      end

    end
  end
end