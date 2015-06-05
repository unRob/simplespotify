module SimpleSpotify
  module Model
    class Track
      include Resource

      one :album
      many :artists, paginated: true

      prop :markets, from: :available_markets
      prop :disc_number
      prop :duration_ms
      prop :explicit
      merge :external_ids
      prop :playable, from: :is_playable

      prop :name
      prop :popularity
      prop :preview_url
      prop :track_number

      def duration
        Time.at(@duration_ms/1000).utc.strftime("%H:%M:%S")
      end

      def playable?
        playable == true
      end

    end
  end
end