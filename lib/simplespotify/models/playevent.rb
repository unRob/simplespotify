require 'time'

module SimpleSpotify
  module Model

    class PlayEvent
      include Resource

      prop :played_at
      one :track

      def initialize data
        data[:played_at] = Time.parse(data[:played_at]) if data[:played_at].is_a? String
        super data
      end

    end
  end
end