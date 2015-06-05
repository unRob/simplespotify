module SimpleSpotify
  module Model
    class Image
      include Resource

      prop :height
      prop :width
      prop :url

      def to_s
        url
      end

    end
  end
end