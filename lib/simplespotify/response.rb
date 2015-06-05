module SimpleSpotify
  class Response

    attr_reader :body, :code, :request

    def initialize code, body, request
      @code = code
      @request = request
      if (200..299).include? code
        begin
          @body = JSON.parse(body, symbolize_names: true)
        rescue
          raise SimpleSpotify::Error::BadResponse.new(code, body, request)
        end
      else
        body = JSON.parse(body, symbolize_names: true) rescue nil
        raise SimpleSpotify::Error.for(code).new(code, body, request)
      end
    end

  end
end